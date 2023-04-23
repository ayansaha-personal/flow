import 'package:cloud_firestore/cloud_firestore.dart';

class FlowProject {
  String id;
  String initialRoute = 'home';
  String name;
  String packageName;

  FlowProject({required this.id, required this.name, required this.packageName, this.initialRoute = 'home'});

  factory FlowProject.fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FlowProject(id: snapshot.id, name: data?['name'], packageName: data?['packageName'], initialRoute: data?['initialRoute']);
  }

  Map<String, dynamic> toDb() {
    return {
      "name": name,
      "packageName": packageName,
      "initialRoute": initialRoute,
    };
  }
}
