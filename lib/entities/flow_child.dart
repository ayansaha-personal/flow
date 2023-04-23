import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flutter/material.dart';

class FlowChildView extends StatelessWidget {
  final String? projectId;
  final String routeId;
  final String childId;

  const FlowChildView(this.projectId, this.routeId, this.childId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("DATA CHK:: ${this.projectId}, ${this.routeId}, ${this.childId}");
    return StreamBuilder<DocumentSnapshot<FlowWidget>>(
        stream: dbWidgetRef(projectId, routeId, childId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data!.data() != null && snapshot.data!.exists) {
            return snapshot.data!.data()!.widget(projectId, routeId)!;
          }
          return Container();
        });
  }
}
