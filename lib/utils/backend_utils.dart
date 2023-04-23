import 'dart:convert';
import 'package:flow/entities/flow_access.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/entities/flow_project.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:http/http.dart' as http;

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

// PROJECTS
const String projectsCollection = "projects";
CollectionReference<FlowProject> dbProjectsRef =
    db.collection(projectsCollection).withConverter<FlowProject>(fromFirestore: FlowProject.fromDb, toFirestore: (FlowProject project, _) => project.toDb());

// PROJECT ACCESS
enum UserRoles { owner, editor, commenter, visitor }

extension UserRolesExtension on UserRoles {
  String get json => toString().split(".").last;
}

const String accessCollection = "access";

CollectionReference<FlowAccess> dbProjectAccessRef(String uid) =>
    db.collection(projectsCollection).doc(uid).collection(accessCollection).withConverter<FlowAccess>(fromFirestore: FlowAccess.fromDb, toFirestore: (FlowAccess access, _) => access.toDb());

// PROJECT USER ACCESS
DocumentReference<FlowAccess> dbProjectUserAccessRef(String uid, String userId) => db
    .collection(projectsCollection)
    .doc(uid)
    .collection(accessCollection)
    .doc(userId)
    .withConverter<FlowAccess>(fromFirestore: FlowAccess.fromDb, toFirestore: (FlowAccess access, _) => access.toDb());

// ROUTES
const String routesCollection = "routes";

CollectionReference dbRoutesRef(projectId) => db.collection(projectsCollection).doc(projectId).collection(routesCollection);

// WIDGETS
const String widgetsCollection = "widgets";

CollectionReference dbWidgetsRef(projectId, routeId) => db.collection(projectsCollection).doc(projectId).collection(routesCollection).doc(routeId).collection(widgetsCollection);

DocumentReference<FlowWidget> dbWidgetRef(projectId, routeId, widgetId) {
  return db
      .collection(projectsCollection)
      .doc(projectId)
      .collection(routesCollection)
      .doc(routeId)
      .collection(widgetsCollection)
      .doc(widgetId)
      .withConverter(fromFirestore: FlowWidget.fromDb, toFirestore: (FlowWidget widget, _) => widget.toDb());
}

Future<void> dbWidgetUpdateRef(projectId, routeId, widgetId, String key, dynamic value) {
  return db.collection(projectsCollection).doc(projectId).collection(routesCollection).doc(routeId).collection(widgetsCollection).doc(widgetId).update({key: value});
}

Future<void> sendPushMessage(String token, double x, double y) async {
  print("SENDING PUSH");
  try {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=AAAARgbHnbU:APA91bEGGiaL7Ckhcrt3s-yrRulWY1XcgmzB7A32jxc2OkjdSitf-gusj1zwpIaLjYhCl3OMk7zLKGEcgS--p5FpWWuESpbgkfYhSRFr-v3GHhYQqmPO9oHD2D79V_qD-x4LO4jEc4VV'
      },
      body: constructFCMPayload(token, x, y),
    );
    print('FCM request for device sent!');
  } catch (e) {
    print(e.toString());
  }
}

String constructFCMPayload(String token, double x, double y) {
  return jsonEncode({
    'to': token,
    'data': {
      'member': auth.currentUser!.uid,
      'y': y,
      'x': x,
    },
  });
}
