import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flow/entities/flow_access.dart';
import 'package:flow/entities/flow_child.dart';
import 'package:flow/entities/flow_project.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/providers/active_stage_state.dart';
import 'package:flow/providers/active_widget_state.dart';
import 'package:flow/providers/stage_size_state.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/utils/stage_utils.dart';
import 'package:flow/utils/style_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StageView extends StatefulWidget {
  const StageView({Key? key}) : super(key: key);

  @override
  State<StageView> createState() => _StageViewState();
}

class _StageViewState extends State<StageView> {
  List<FlowAccess> memberList = [];

  initRemoteConnection(String projectId) async {
    QuerySnapshot<FlowAccess> members = await dbProjectAccessRef(projectId).where('status', isEqualTo: 'online').where('token', isNull: false).get();
    memberList =  members.docs.map((e) => e.data()).toList();
    try {
      String? token;
      if (kIsWeb) {
        token = await FirebaseMessaging.instance.getToken(vapidKey: "BPhcK0qEQiEiks6fBVXOInXEA-TSHA13zLyVjHYLIAVIcGc-e0mswwlXlxIezuSwnEO37u0eNz9hQnSp4njKygA");
      } else {
        token = await FirebaseMessaging.instance.getToken();
      }
      await dbProjectUserAccessRef(projectId, auth.currentUser!.uid).update({'token': token, 'status': 'online'});
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) async {
        token = fcmToken;
        await dbProjectUserAccessRef(projectId, auth.currentUser!.uid).update({'token': token});
        debugPrint("TOKEN UPDATED");
      }).onError((err) {
        debugPrint(err.toString());
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveProjectState, FlowProject?>(builder: (context, project) {
      if (project == null) return Container();

      return FutureBuilder<void>(
          future: initRemoteConnection(project.id),
          builder: (context, snap) {
            return MouseRegion(
              onHover: (ev) {
                print("mem:: ${memberList.length}");
                memberList.forEach((e) => sendPushMessage(e.token!, ev.position.dx, ev.position.dy));
              },
              child: InteractiveViewer(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
                  color: Colors.grey[600],
                  child: Center(
                    child: BlocBuilder<StageSizeState, StageSize>(
                      builder: (context, stageSize) => AspectRatio(
                        aspectRatio: stageSize.ratio.width / stageSize.ratio.height,
                        child: BlocBuilder<ActiveStageState, String>(builder: (context, activeStage) {
                          return StreamBuilder<QuerySnapshot>(
                              stream: dbRoutesRef(project.id).snapshots(),
                              builder: (context, routesSnap) {
                                if (routesSnap.data == null) {
                                  return Container();
                                }
                                List<QueryDocumentSnapshot> routeDocs = routesSnap.data?.docs as List<QueryDocumentSnapshot>;
                                Map<String, RouteView> routes = {
                                  for (QueryDocumentSnapshot snap in routeDocs) snap.id: RouteView(projectId: project.id, routeId: snap.id, bodyId: (snap.data() as Map<String, dynamic>)['body'])
                                };
                                return MouseRegion(
                                    onExit: (ev) {
                                      context.read<ActiveWidgetState>().update(null);
                                    },
                                    child: routes[activeStage]!);
                              });
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}

class RouteView extends StatelessWidget {
  final String? projectId;
  final String routeId;
  final String bodyId;

  const RouteView({Key? key, required this.projectId, required this.routeId, required this.bodyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveWidgetState, FlowWidget?>(builder: (context, activeWidget) {
      return Scaffold(
        body: DragTarget<FlowWidget>(onAccept: (FlowWidget? widget) async {
          if (widget != null && activeWidget != null) {
            if (activeWidget.json.containsKey('child')) {
              if (activeWidget.json['child'] != null) {
                bool replace = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Replace Widget?'),
                          content: const Text('Are you sure you want to replace this widget?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Replace')),
                            ),
                          ],
                        ));
                if (replace) {
                  await dbWidgetsRef(projectId, routeId).doc(activeWidget.json['child']).set(widget.toDb());
                }
              } else {
                DocumentReference newWidgetRef = await dbWidgetsRef(projectId, routeId).add(widget.toDb());
                dbWidgetRef(projectId, routeId, activeWidget.key).update({'child': newWidgetRef.id});
              }
            } else if (activeWidget.json.containsKey('children')) {
              DocumentReference newWidgetRef = await dbWidgetsRef(projectId, routeId).add(widget.toDb());
              dbWidgetRef(projectId, routeId, activeWidget.key).update({
                'children': FieldValue.arrayUnion([newWidgetRef.id])
              });
            } else {
              showErrorMessage(context, 'Oops! We cannot add widget inside this widget');
            }
          }
        }, builder: (context, List<FlowWidget?> acceptedList, List<dynamic> rejectedList) {
          return FlowChildView(projectId, routeId, bodyId);
        }),
      );
    });
  }
}
