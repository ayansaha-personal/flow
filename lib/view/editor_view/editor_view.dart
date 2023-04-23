import 'package:flow/entities/flow_project.dart';
import 'package:flow/providers/active_project_state.dart';
import 'package:flow/providers/stage_size_state.dart';
import 'package:flow/utils/stage_utils.dart';
import 'package:flow/view/editor_view/attributes_view/attributes_view.dart';
import 'package:flow/view/editor_view/stage_view/stage_view.dart';
import 'package:flow/view/editor_view/widget_view/widget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditorView extends StatefulWidget {
  const EditorView({Key? key}) : super(key: key);

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow'),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.desktop_mac,
              size: 24,
            ),
            itemBuilder: (context) => desktopRatios
                .map((e) => PopupMenuItem<StageSize>(
                    value: e,
                    child: Row(
                      children: [
                        const Icon(Icons.desktop_mac),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(e.name),
                        ),
                      ],
                    )))
                .toList(),
            onSelected: (StageSize size) {
              context.read<StageSizeState>().update(size);
            },
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.tablet_mac_outlined,
              size: 24,
            ),
            itemBuilder: (context) => tabRatios
                .map((e) => PopupMenuItem<StageSize>(
                    value: e,
                    child: Row(
                      children: [
                        const Icon(Icons.tablet_mac_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(e.name),
                        ),
                      ],
                    )))
                .toList(),
            onSelected: (StageSize size) => context.read<StageSizeState>().update(size),
          ),
          PopupMenuButton(
            icon: const Icon(
              Icons.phone_iphone_outlined,
              size: 24,
            ),
            itemBuilder: (context) => mobileRatios
                .map((e) => PopupMenuItem<StageSize>(
                    value: e,
                    child: Row(
                      children: [
                        const Icon(Icons.phone_iphone_outlined),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(e.name),
                        ),
                      ],
                    )))
                .toList(),
            onSelected: (StageSize size) => context.read<StageSizeState>().update(size),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('EXPORT'))
        ],
      ),
      body: Row(
        children: const [WidgetView(), Expanded(flex: 5, child: StageView()), Expanded(child: AttributesView())],
      ),
    );
  }
}
