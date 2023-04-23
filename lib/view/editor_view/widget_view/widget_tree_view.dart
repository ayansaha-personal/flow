import 'package:flow/entities/flow_project.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/providers/active_widget_state.dart';
import 'package:flow/providers/selected_widget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetTreeDataView extends StatefulWidget {
  const WidgetTreeDataView({Key? key}) : super(key: key);

  @override
  State<WidgetTreeDataView> createState() => _WidgetTreeDataViewState();
}

class _WidgetTreeDataViewState extends State<WidgetTreeDataView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveProjectState, FlowProject?>(
      builder: (context, project) {
        return BlocBuilder<SelectedWidgetState, FlowWidget?>(builder: (context, activeWidget) {
          return Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              // child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 280), child: getChildView(widget, activeWidget))),
            ),
          );
        });
      }
    );
  }

  Widget getChildView(FlowWidget widget, FlowWidget? activeWidget) {
    bool active = activeWidget != null && widget == activeWidget;
    bool hasChild = widget.json.containsKey('child') && widget.json['child'] != null;
    bool hasChildren = widget.json.containsKey('children') && widget.json['children'] != null;
    if (hasChild || hasChildren) {
      return ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: const EdgeInsets.only(left: 15.0),
        onExpansionChanged: (bool expanded) => context.read<SelectedWidgetState>().update(widget),
        title: Text(
          widget.json['class'],
          style: TextStyle(fontWeight: active ? FontWeight.bold : FontWeight.normal, color: active ? Colors.green[300] : Colors.deepPurple[300]),
        ),
        children: hasChild ? <Widget>[getChildView(widget.toClass().child, activeWidget)] : (widget.toClass().children as List<FlowWidget>).map((e) => getChildView(e, activeWidget)).toList(),
      );
    } else {
      return ListTile(
        onTap: () => context.read<SelectedWidgetState>().update(widget),
        title: Text(
          widget.json['class'],
          style: TextStyle(fontWeight: active ? FontWeight.bold : FontWeight.normal, color: active ? Colors.green[300] : Colors.deepPurple[300]),
        ),
      );
    }
  }
}
