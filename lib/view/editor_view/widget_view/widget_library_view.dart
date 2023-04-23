import 'package:flow/entities/flow_column.dart';
import 'package:flow/entities/flow_container.dart';
import 'package:flow/entities/flow_row.dart';
import 'package:flow/entities/flow_text.dart';
import 'package:flow/entities/flow_widget.dart';
import 'package:flow/utils/key_utils.dart';
import 'package:flow/view/editor_view/widget_view/widget_item_view.dart';
import 'package:flutter/material.dart';

class WidgetLibraryView extends StatefulWidget {
  const WidgetLibraryView({Key? key}) : super(key: key);

  @override
  State<WidgetLibraryView> createState() => _WidgetLibraryViewState();
}

class _WidgetLibraryViewState extends State<WidgetLibraryView> {
  List<FlowWidget> widgets = [FlowContainer(key: generateKey()), FlowText(key: generateKey()), FlowColumn(key: generateKey()), FlowRow(key: generateKey())];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: widgets.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return WidgetItem(
                data: widgets[index],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
          ),
        ),
      ],
    );
  }
}
