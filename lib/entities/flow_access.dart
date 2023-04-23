import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/utils/backend_utils.dart';

class FlowAccess {
  String id;
  String role;
  String? status;
  String? token;

  FlowAccess({required this.id, required this.role, this.status, this.token});

  factory FlowAccess.fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FlowAccess(id: snapshot.id, role: data?['role'], status: data?['status'], token: data?['token']);
  }

  Map<String, dynamic> toDb() {
    return {"role": role, "status": status, "token": token};
  }
}
