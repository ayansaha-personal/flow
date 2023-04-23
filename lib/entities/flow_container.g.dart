// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_container.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

class FlowContainer extends GenFlowContainer {
  FlowContainer({required super.key, super.type = 'Container'});

  @override
  Map<String, dynamic> get attributes => {
        'width': 'double?',
        'height': 'double?',
        'color': 'Color?',
        'margin': 'EdgeInsets?',
        'padding': 'EdgeInsets?',
        'decoration': 'dynamic',
      };

  @override
  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'Container',
        'width': width,
        'height': height,
        'color': color?.json,
        'margin': margin?.json,
        'padding': padding?.json,
        'decoration': decoration?.json,
        'child': child,
        'key': key,
      };

// FROM DB
  @override
  FlowContainer fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    FlowContainer widget = FlowContainer(key: snapshot.id, type: snapshot.data()?['type']);
    widget.width = data?['width'];
    widget.height = data?['height'];
    widget.color = data?['color'];
    widget.margin = data?['margin'] != null ? (data?['margin'] as List<dynamic>).edgeInsets : null;
    widget.padding = data?['padding'] != null ? (data?['padding'] as List<dynamic>).edgeInsets : null;
    widget.decoration = data?['decoration'];
    widget.child = data?['child'];
    return widget;
  }

// TO DB
  @override
  Map<String, dynamic> toDb() {
    return {
      'type': 'Container',
      'width': width,
      'height': height,
      'color': color?.json,
      'margin': margin?.json,
      'padding': padding?.json,
      'decoration': decoration?.json,
      'child': child,
    };
  }

  @override
  Widget widget(projectId, routeId) => FlowFocusWrapper(
        data: this,
        child: Container(
          width: width,
          height: height,
          color: color,
          margin: margin,
          padding: padding,
          decoration: decoration?.widget,
          child: child != null ? FlowChildView(projectId, routeId, child!) : null,
          key: Key(key),
        ),
      );

  @override
  Map<String, dynamic> get libraryItem => {'name': 'Container', 'icon': Icons.texture};

  @override
  String get widgetName => 'Container';
}

// **************************************************************************
// StyleGenerator
// **************************************************************************

class FlowBoxDecoration extends GenFlowBoxDecoration {
  FlowBoxDecoration();

  List<Map<String, dynamic>> get attributes => [
        {'color': 'Color?'},
        {'image': 'DecorationImage?'},
        {'border': 'Border?'},
        {'borderRadius': 'BorderRadius?'},
        {'boxShadow': 'List<BoxShadow>?'},
        {'gradient': 'Gradient?'},
        {'backgroundBlendMode': 'BlendMode?'},
        {'shape': 'BoxShape'},
      ];

  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'BoxDecoration',
        'color': color?.json,
        'image': image?.json,
        'border': border?.json,
        'borderRadius': borderRadius?.json,
        'boxShadow': boxShadow?.json,
        'gradient': gradient?.json,
        'backgroundBlendMode': backgroundBlendMode?.json,
        'shape': shape.json,
      };

  BoxDecoration get widget => BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
      );

  Map<String, dynamic> get libraryItem => {'name': 'BoxDecoration', 'icon': Icons.texture};

  String get widgetName => 'BoxDecoration';
}
