import 'package:flow/entities/flow_project.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/providers/active_stage_state.dart';
import 'package:flow/providers/active_widget_state.dart';
import 'package:flow/providers/selected_widget_state.dart';
import 'package:flow/utils/backend_utils.dart';
import 'package:flow/utils/style_utils.dart';
import 'package:flow/view/editor_view/attributes_view/components/edge_insets_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttributesView extends StatefulWidget {
  const AttributesView({Key? key}) : super(key: key);

  @override
  State<AttributesView> createState() => _AttributesViewState();
}

class _AttributesViewState extends State<AttributesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ActiveProjectState, FlowProject?>(builder: (context, project) {
        return BlocBuilder<ActiveStageState, String>(builder: (context, activeStage) {
          return BlocBuilder<SelectedWidgetState, FlowWidget?>(builder: (context, FlowWidget? widget) {
            if (widget != null) {
              List<String> attributeKeys = widget.attributes.keys.toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.widgetName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  attributeKeys.contains('padding') || attributeKeys.contains('margin')
                      ? EdgeInsetsView(
                          padding: widget.toType().padding,
                          margin: widget.toType().margin,
                          onUpdate: (EdgeInsets? padding, EdgeInsets? margin) {
                            if (attributeKeys.contains('padding')) {
                              dbWidgetRef(project?.id, activeStage, widget.key).update({'padding': padding?.json});
                            } else if (attributeKeys.contains('margin')) {
                              dbWidgetRef(project?.id, activeStage, widget.key).update({'margin': margin?.json});
                            }
                          },
                        )
                      : Container(),
                  Expanded(
                      child: ListView.builder(
                          itemCount: widget.attributes.entries.length,
                          itemBuilder: (context, index) {
                            return Container();
                          })),
                  ListView(
                    shrinkWrap: true,
                    children: widget.attributes.entries
                        .map((e) => ListTile(
                              title: Text(e.key),
                              subtitle: Text(e.value),
                            ))
                        .toList(),
                  ),
                ],
              );
            } else {
              return Container();
            }
          });
        });
      }),
    );
  }
}

class PaddingView extends StatefulWidget {
  const PaddingView({Key? key}) : super(key: key);

  @override
  State<PaddingView> createState() => _PaddingViewState();
}

class _PaddingViewState extends State<PaddingView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
