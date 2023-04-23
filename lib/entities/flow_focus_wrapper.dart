import 'package:flow/entities/flow_widget.dart';
import 'package:flow/providers/active_widget_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow/providers/selected_widget_state.dart';
import 'package:flutter/material.dart';

class FlowFocusWrapper extends StatefulWidget {
  final FlowWidget data;
  final Widget child;

  const FlowFocusWrapper({Key? key, required this.child, required this.data}) : super(key: key);

  @override
  State<FlowFocusWrapper> createState() => _FlowFocusWrapperState();
}

class _FlowFocusWrapperState extends State<FlowFocusWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveWidgetState, FlowWidget?>(
      builder: (context, focussedWidget) {
        return BlocBuilder<SelectedWidgetState, FlowWidget?>(builder: (context, selectedWidget) {
          bool activeWidget = selectedWidget != null && selectedWidget.key == widget.data.key;
          bool focussed = focussedWidget != null && focussedWidget.key == widget.data.key;
          return CustomPaint(
            painter: ClassNamePainter(widget.data.json['class'], activeWidget, focussed),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: focussed
                            ? Colors.deepPurple
                            : activeWidget
                                ? Colors.green
                                : Colors.transparent,
                        width: 2)),
                child: GestureDetector(
                  onTap: () {
                    if (focussed) {
                      context.read<SelectedWidgetState>().update(widget.data);
                    }
                  },
                  child: MouseRegion(
                    onEnter: (ev) {
                      context.read<ActiveWidgetState>().update(widget.data);
                    },
                    child: widget.child,
                  ),
                )),
          );
        });
      }
    );
  }
}

class ClassNamePainter extends CustomPainter {
  final String text;
  final bool activeWidget;
  final bool focussed;

  ClassNamePainter(this.text, this.activeWidget, this.focussed);

  @override
  void paint(Canvas canvas, Size size) {
    if (focussed) {
      var background = Paint()
        ..color = Colors.deepPurple
        ..style = PaintingStyle.fill;
      final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 12,
      );
      final textSpan = TextSpan(
        text: text,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final offset = Offset(2, -14);
      canvas.drawRect(Offset(0, -16) & Size(textPainter.size.width + 4, 16), background);
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
