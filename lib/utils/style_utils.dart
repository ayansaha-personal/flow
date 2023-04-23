import 'package:flow/entities/flow_widget.dart';
import 'package:flutter/material.dart';

showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.red[900],
    closeIconColor: Colors.white,
  ));
}

extension HexString on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String get json => '#'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorListExtension on List<Color> {
  List<String> get json => map((e) => e.json).toList();
}

extension DynamicListExtension on List<dynamic> {
  EdgeInsets? get edgeInsets => EdgeInsets.fromLTRB(this[0], this[1], this[2], this[3]);
}

extension EdgeInsetsExtension on EdgeInsets {
  List<double> get json => [left, top, right, bottom];
}

extension MainAxisAlignmentExtension on MainAxisAlignment {
  String get json => toString().split(".").last;
}

extension CrossAxisAlignmentExtension on CrossAxisAlignment {
  String get json => toString().split(".").last;
}

extension ChildrenListJson on List<FlowWidget> {
  List<Map<String, dynamic>> get json => map((e) => e.json).toList();
}

extension FontWeightExtension on FontWeight {
  String get json => toString().split(".").last;
}

extension FontStyleExtension on FontStyle {
  String get json => toString().split(".").last;
}

extension TextBaselineExtension on TextBaseline {
  String get json => toString().split(".").last;
}

extension TextOverflowExtension on TextOverflow {
  String get json => toString().split(".").last;
}

extension TextDecorationExtension on TextDecoration {
  String get json => toString();
}

extension TextDecorationStyleExtension on TextDecorationStyle {
  String get json => toString().split(".").last;
}

extension ShadowListExtension on List<Shadow> {
  List<Map<String, dynamic>> get json => map((e) => {
        'color': e.color.json,
        'blurRadius': e.blurRadius,
        'offset': [e.offset.dx, e.offset.dy]
      }).toList();
}

extension BlendModeExtension on BlendMode {
  String get json => toString().split(".").last;
}

extension BlurStyleExtension on BlurStyle {
  String get json => toString().split(".").last;
}

extension BoxShapeExtension on BoxShape {
  String get json => toString().split(".").last;
}

extension BoxShadowList on List<BoxShadow> {
  List<Map<String, dynamic>> get json => map((e) => {
        'color': e.color.json,
        'blurRadius': e.blurRadius,
        'offset': [e.offset.dx, e.offset.dy],
        'spreadRadius': e.spreadRadius,
        'blurStyle': e.blurStyle.json
      }).toList();
}

extension BorderSizeExtension on BorderSide {
  Map<String, dynamic> get json => {'color': color.json, 'width': width, 'style': style.toString().split(".").last};
}

extension FlowBorderExtension on Border {
  Map<String, dynamic> get json => {
        'top': top.json,
        'right': right.json,
        'bottom': bottom.json,
        'left': left.json,
      };
}

extension RadiusExtension on Radius {
  Map<String, dynamic> get json => {'x': x, 'y': y};
}

extension BorderRadiusExtension on BorderRadius {
  Map<String, dynamic> get json => {
        'topLeft': topLeft.json,
        'topRight': topRight.json,
        'bottomLeft': bottomLeft.json,
        'bottomRight': bottomRight.json,
      };
}

extension GradientExtension on Gradient {
  Map<String, dynamic> get json => {'colors': colors.json, 'stops': stops};
}

extension DecorationImageExtension on DecorationImage {
  Map<String, dynamic> get json => {
        'image': image is NetworkImage
            ? (image as NetworkImage).url
            : image is AssetImage
                ? (image as AssetImage).assetName
                : (image as FileImage).file.path,
        'repeat': repeat.json,
        'fit': fit?.json,
        'alignment': alignment.json,
        'matchTextDirection': matchTextDirection,
        'scale': scale,
        'opacity': opacity,
        'filterQuality': filterQuality.json,
        'invertColors': invertColors,
        'isAntiAlias': isAntiAlias,
      };
}

extension BoxFitExtension on BoxFit {
  String get json => toString().split(".").last;
}

extension ImageRepeatExtension on ImageRepeat {
  String get json => toString().split(".").last;
}

extension AlignmentExtension on AlignmentGeometry {
  String get json => toString();
}

extension FilterQualityExtension on FilterQuality {
  String get json => toString().split(".").last;
}
