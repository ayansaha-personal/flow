// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_column.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

class FlowColumn extends GenFlowColumn {
  FlowColumn({required super.key, super.type = 'Column'});
  @override
  Map<String, dynamic> get attributes => {
        'children': 'List<String>',
        'mainAxisAlignment': 'MainAxisAlignment?',
        'crossAxisAlignment': 'CrossAxisAlignment?',
      };
  @override
  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'Column',
        'children': children,
        'mainAxisAlignment': mainAxisAlignment?.json,
        'crossAxisAlignment': crossAxisAlignment?.json,
        'key': key,
      };

// FROM DB
  @override
  FlowColumn fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    FlowColumn widget =
        FlowColumn(key: snapshot.id, type: snapshot.data()?['type']);
    widget.children = data?['children'];
    widget.mainAxisAlignment = data?['mainAxisAlignment'];
    widget.crossAxisAlignment = data?['crossAxisAlignment'];
    return widget;
  }

// TO DB
  @override
  Map<String, dynamic> toDb() {
    return {
      'type': 'Column',
      'children': children,
      'mainAxisAlignment': mainAxisAlignment?.json,
      'crossAxisAlignment': crossAxisAlignment?.json,
    };
  }

  @override
  Widget widget(projectId, routeId) => FlowFocusWrapper(
        data: this,
        child: Column(
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
      {'name': 'Column', 'icon': Icons.texture};
  @override
  String get widgetName => 'Column';
}
