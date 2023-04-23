import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_child.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/style_utils.dart';
import 'package:flow_annotation/flow_annotation.dart';
import 'package:flutter/material.dart';

import 'flow_focus_wrapper.dart';

part 'flow_column.g.dart';

@GenerateWidget
class GenFlowColumn extends FlowWidget {
  List<String> children = [];
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;

  GenFlowColumn({required super.key, required super.type});

}
