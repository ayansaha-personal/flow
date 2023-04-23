import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_column.dart';
import 'package:flow/entities/flow_container.dart';
import 'package:flow/entities/flow_row.dart';
import 'package:flow/entities/flow_text.dart';
import 'package:flutter/material.dart';

class FlowWidget {
  String key;
  String type;

  FlowWidget({required this.key, required this.type});

  Widget? widget(projectId, routeId) => null;

  Map<String, dynamic> get json => <String, dynamic>{};

  Map<String, dynamic> get attributes => {};

  Map<String, dynamic> get libraryItem => {};

  String get widgetName => '';

  FlowWidget fromDb(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    FlowWidget flowWidget = FlowWidget(key: snapshot.id, type: snapshot.data()?['type']).toClass();
    return flowWidget.fromDb(snapshot, options);
  }

  factory FlowWidget.fromDb(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    FlowWidget flowWidget = FlowWidget(key: snapshot.id, type: snapshot.data()?['type']).toClass();
    return flowWidget.fromDb(snapshot, options);
  }

  Map<String, dynamic> toDb() => toClass().toDb();
}

extension FlowWidgetExtension on FlowWidget {
  dynamic toClass() {
    if (type == 'Text') {
      return FlowText(key: key, type: type);
    } else if (type == 'Column') {
      return FlowColumn(key: key, type: type);
    } else if (type == 'Row') {
      return FlowRow(key: key, type: type);
    } else {
      return FlowContainer(key: key, type: type);
    }
  }

  dynamic toType() {
    if (this is FlowContainer) {
      return this as FlowContainer;
    } else if (this is FlowText) {
      return this as FlowText;
    } else if (this is FlowColumn) {
      return this as FlowColumn;
    } else if (this is FlowRow) {
      return this as FlowRow;
    }
  }
}
