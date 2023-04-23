import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_child.dart';
import 'package:flow/entities/flow_focus_wrapper.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/utils/style_utils.dart';
import 'package:flow_annotation/flow_annotation.dart';
import 'package:flutter/material.dart';

part 'flow_container.g.dart';

@GenerateWidget
class GenFlowContainer extends FlowWidget {
  double? width;
  double? height;
  Color? color;
  EdgeInsets? margin;
  EdgeInsets? padding;
  FlowBoxDecoration? decoration;
  String? child;

  GenFlowContainer({required super.key, required super.type});
}


@GenerateStyle
class GenFlowBoxDecoration {
  Color? color;
  DecorationImage? image;
  Border? border;
  BorderRadius? borderRadius;
  List<BoxShadow>? boxShadow;
  Gradient? gradient;
  BlendMode? backgroundBlendMode;
  BoxShape shape = BoxShape.rectangle;

  GenFlowBoxDecoration();
}


