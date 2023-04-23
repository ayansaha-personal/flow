// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_text.dart';

// **************************************************************************
// WidgetGenerator
// **************************************************************************

class FlowText extends GenFlowText {
  FlowText({required super.key, super.type = 'Text'});
  @override
  Map<String, dynamic> get attributes => {
        'value': 'String?',
        'style': 'dynamic',
      };
  @override
  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'Text',
        'value': value,
        'style': style?.json,
        'key': key,
      };

// FROM DB
  @override
  FlowText fromDb(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    FlowText widget =
        FlowText(key: snapshot.id, type: snapshot.data()?['type']);
    widget.value = data?['value'];
    widget.style = data?['style'];
    return widget;
  }

// TO DB
  @override
  Map<String, dynamic> toDb() {
    return {
      'type': 'Text',
      'value': value,
      'style': style?.json,
    };
  }

  @override
  Widget widget(projectId, routeId) => FlowFocusWrapper(
        data: this,
        child: Text(
          value ?? '',
          style: style?.widget,
          key: Key(key),
        ),
      );
  @override
  Map<String, dynamic> get libraryItem =>
      {'name': 'Text', 'icon': Icons.texture};
  @override
  String get widgetName => 'Text';
}

// **************************************************************************
// StyleGenerator
// **************************************************************************

class FlowTextStyle extends GenFlowTextStyle {
  FlowTextStyle();
  List<Map<String, dynamic>> get attributes => [
        {'color': 'Color?'},
        {'backgroundColor': 'Color?'},
        {'fontSize': 'double?'},
        {'fontWeight': 'FontWeight?'},
        {'fontStyle': 'FontStyle?'},
        {'letterSpacing': 'double?'},
        {'wordSpacing': 'double?'},
        {'textBaseline': 'TextBaseline?'},
        {'height': 'double?'},
        {'shadows': 'List<Shadow>?'},
        {'decoration': 'TextDecoration?'},
        {'decorationColor': 'Color?'},
        {'decorationStyle': 'TextDecorationStyle?'},
        {'decorationThickness': 'double?'},
        {'fontFamily': 'String?'},
        {'overflow': 'TextOverflow?'},
      ];
  Map<String, dynamic> get json => <String, dynamic>{
        'class': 'TextStyle',
        'color': color?.json,
        'backgroundColor': backgroundColor?.json,
        'fontSize': fontSize,
        'fontWeight': fontWeight?.json,
        'fontStyle': fontStyle?.json,
        'letterSpacing': letterSpacing,
        'wordSpacing': wordSpacing,
        'textBaseline': textBaseline?.json,
        'height': height,
        'shadows': shadows?.json,
        'decoration': decoration?.json,
        'decorationColor': decorationColor?.json,
        'decorationStyle': decorationStyle?.json,
        'decorationThickness': decorationThickness,
        'fontFamily': fontFamily,
        'overflow': overflow?.json,
      };
  TextStyle get widget => TextStyle(
        color: color,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        shadows: shadows,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFamily: fontFamily,
        overflow: overflow,
      );
  Map<String, dynamic> get libraryItem =>
      {'name': 'TextStyle', 'icon': Icons.texture};
  String get widgetName => 'TextStyle';
}
