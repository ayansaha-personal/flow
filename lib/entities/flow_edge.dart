import 'package:flutter/material.dart';

class FlowEdge {
  double left = 0.0;
  double right = 0.0;
  double top = 0.0;
  double bottom = 0.0;

  Map<String, dynamic> get json => {'left': left, 'right': right, 'top': top, 'bottom': bottom};
}

extension FlowEdgeExtension on FlowEdge {
  EdgeInsetsGeometry toEdgeInsets() {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}
