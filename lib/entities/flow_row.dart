import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow/entities/flow_child.dart';
import 'package:flow/entities/flow_focus_wrapper.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/style_utils.dart';
import 'package:flow_annotation/flow_annotation.dart';
import 'package:flutter/material.dart';

part 'flow_row.g.dart';

@GenerateWidget
class GenFlowRow extends FlowWidget {
  List<String> children = [];
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;

  GenFlowRow({required super.key, required super.type});

}
