import 'package:flow/entities/flow_widget.dart';
import 'package:flutter/material.dart';

class WidgetItem extends StatefulWidget {
  final FlowWidget data;
  const WidgetItem({Key? key, required this.data}) : super(key: key);

  @override
  State<WidgetItem> createState() => _WidgetItemState();
}

class _WidgetItemState extends State<WidgetItem> {
  @override
  Widget build(BuildContext context) {
    return Draggable<FlowWidget>(
      feedback: Container(
        height: 50,
        width: 50,
        color: Colors.grey[800],
        child: Center(child: Icon(widget.data.libraryItem['icon'])),
      ),
      data: widget.data,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      child: Container(
        padding: EdgeInsets.all(5),
        color: Colors.grey[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(widget.data.libraryItem['icon']),
            Container(
              height: 5.0,
            ),
            Text(
              widget.data.libraryItem['name'],
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
