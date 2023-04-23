import 'package:flow/view/editor_view/widget_view/widget_library_view.dart';
import 'package:flow/view/editor_view/widget_view/widget_tree_view.dart';
import 'package:flutter/material.dart';

class WidgetView extends StatefulWidget {
  const WidgetView({Key? key}) : super(key: key);

  @override
  State<WidgetView> createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {
  bool expanded = false;
  int selectedIndex = 0;
  List<Map<String, dynamic>> sections = [
    {'icon': Icons.widgets, 'title': 'Widgets'},
    {'icon': Icons.pages, 'title': 'Pages'}
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (ev) => setState(() => expanded = false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sections
                .map((e) => GestureDetector(
                      onTap: () {
                        selectedIndex = sections.indexOf(e);
                        expanded = true;
                        setState(() {});
                      },
                      child: WidgetSectionIcon(
                        icon: e['icon'],
                        title: e['title'],
                      ),
                    ))
                .toList(),
          ),
          expanded
              ? SizedBox(
                  width: 280,
                  child: Container(
                    color: Colors.grey[900],
                    child: [const WidgetLibraryView(), const WidgetTreeDataView()][selectedIndex],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class WidgetSectionIcon extends StatelessWidget {
  final String title;
  final IconData icon;

  const WidgetSectionIcon({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      child: SizedBox(height: 60, width: 60, child: Center(child: Icon(icon))),
    );
  }
}
