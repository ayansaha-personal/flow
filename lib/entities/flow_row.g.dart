// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_row.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

class FlowRow extends GenFlowRow {
  FlowRow({required super.key, super.type = 'Row'});
  @override
  Map<String, dynamic> get attributes => {
        'children': 'List<String>',
        'mainAxisAlignment': 'MainAxisAlignment?',
        'crossAxisAlignment': 'CrossAxisAlignment?',
      };
  @override
  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'Row',
        'children': children,
        'mainAxisAlignment': mainAxisAlignment?.json,
        'crossAxisAlignment': crossAxisAlignment?.json,
        'key': key,
      };

// FROM DB
  @override
  FlowRow fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    FlowRow widget = FlowRow(key: snapshot.id, type: snapshot.data()?['type']);
    widget.children = data?['children'];
    widget.mainAxisAlignment = data?['mainAxisAlignment'];
    widget.crossAxisAlignment = data?['crossAxisAlignment'];
    return widget;
  }

// TO DB
  @override
  Map<String, dynamic> toDb() {
    return {
      'type': 'Row',
      'children': children,
      'mainAxisAlignment': mainAxisAlignment?.json,
      'crossAxisAlignment': crossAxisAlignment?.json,
    };
  }

  @override
  Widget widget(projectId, routeId) => FlowFocusWrapper(
        data: this,
        child: Row(
          children: children
              .map((e) => FlowChildView(projectId, routeId, e))
              .toList(),
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          key: Key(key),
        ),
      );
  @override
  Map<String, dynamic> get libraryItem =>
      {'name': 'Row', 'icon': Icons.texture};
  @override
  String get widgetName => 'Row';
}
