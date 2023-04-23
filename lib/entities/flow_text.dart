import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_focus_wrapper.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow_annotation/flow_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flow/utils/style_utils.dart';
part 'flow_text.g.dart';

@GenerateWidget
class GenFlowText extends FlowWidget {
  String? value = 'Text';
  FlowTextStyle? style;

  GenFlowText({required super.key, required super.type});
}

@GenerateStyle
class GenFlowTextStyle {
  Color? color;
  Color? backgroundColor;
  double? fontSize;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? letterSpacing;
  double? wordSpacing;
  TextBaseline? textBaseline;
  double? height;
  List<Shadow>? shadows;
  TextDecoration? decoration;
  Color? decorationColor;
  TextDecorationStyle? decorationStyle;
  double? decorationThickness;
  String? fontFamily;
  TextOverflow? overflow;

  GenFlowTextStyle();
}
