import 'package:flutter/material.dart';

class EdgeInsetsView extends StatefulWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function(EdgeInsets? padding, EdgeInsets? margin) onUpdate;

  const EdgeInsetsView({Key? key, this.padding, this.margin, required this.onUpdate}) : super(key: key);

  @override
  State<EdgeInsetsView> createState() => _EdgeInsetsViewState();
}

class _EdgeInsetsViewState extends State<EdgeInsetsView> {
  int focussed = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MouseRegion(
        onEnter: (ev) {
          setState(() {
            focussed = 1;
          });
        },
        onExit: (ev) {
          setState(() {
            focussed = 0;
          });
        },
        child: Container(
          height: 150,
          width: 280,
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), color: Colors.orange[focussed == 1 ? 600 : 300]?.withOpacity(0.5)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Margin',
                      style: TextStyle(fontSize: 12),
                    )),
                    Expanded(
                      child: TextFieldView(
                        value: (widget.margin?.top ?? 0).toString(),
                        onChanged: (value) {
                          EdgeInsets? update = widget.margin != null ? widget.margin?.copyWith(top: double.parse(value)) : EdgeInsets.only(top: double.parse(value));
                          widget.onUpdate(widget.padding, update);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFieldView(
                      value: (widget.margin?.left ?? 0).toString(),
                      onChanged: (value) {
                        EdgeInsets? update = widget.margin != null ? widget.margin?.copyWith(left: double.parse(value)) : EdgeInsets.only(left: double.parse(value));
                        widget.onUpdate(widget.padding, update);
                      },
                    )),
                    Expanded(
                        flex: 8,
                        child: MouseRegion(
                          onEnter: (ev) {
                            setState(() {
                              focussed = 2;
                            });
                          },
                          onExit: (ev) {
                            setState(() {
                              focussed = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), color: Colors.green[focussed == 2 ? 600 : 300]?.withOpacity(0.5)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          child: Text(
                                        'Padding',
                                        style: TextStyle(fontSize: 12),
                                      )),
                                      Expanded(
                                        child: TextFieldView(
                                          value: (widget.padding?.top ?? 0).toString(),
                                          onChanged: (value) {
                                            EdgeInsets? update = widget.padding != null ? widget.padding?.copyWith(top: double.parse(value)) : EdgeInsets.only(top: double.parse(value));
                                            widget.onUpdate(update, widget.margin);
                                          },
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: TextFieldView(
                                        value: (widget.padding?.left ?? 0).toString(),
                                        onChanged: (value) {
                                          EdgeInsets? update = widget.padding != null ? widget.padding?.copyWith(left: double.parse(value)) : EdgeInsets.only(left: double.parse(value));
                                          widget.onUpdate(update, widget.margin);
                                        },
                                      )),
                                      Expanded(
                                          flex: 8,
                                          child: MouseRegion(
                                            onEnter: (ev) {
                                              setState(() {
                                                focussed = 3;
                                              });
                                            },
                                            onExit: (ev) {
                                              setState(() {
                                                focussed = 2;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), color: Colors.blue[focussed == 3 ? 600 : 300]?.withOpacity(0.5)),
                                            ),
                                          )),
                                      Expanded(
                                          child: TextFieldView(
                                        value: (widget.padding?.right ?? 0).toString(),
                                        onChanged: (value) {
                                          EdgeInsets? update = widget.padding != null ? widget.padding?.copyWith(right: double.parse(value)) : EdgeInsets.only(right: double.parse(value));
                                          widget.onUpdate(update, widget.margin);
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldView(
                                    value: (widget.padding?.bottom ?? 0).toString(),
                                    onChanged: (value) {
                                      EdgeInsets? update = widget.padding != null ? widget.padding?.copyWith(bottom: double.parse(value)) : EdgeInsets.only(bottom: double.parse(value));
                                      widget.onUpdate(update, widget.margin);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        child: TextFieldView(
                      value: (widget.margin?.right ?? 0).toString(),
                      onChanged: (value) {
                        EdgeInsets? update = widget.margin != null ? widget.margin?.copyWith(right: double.parse(value)) : EdgeInsets.only(right: double.parse(value));
                        widget.onUpdate(widget.padding, update);
                      },
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldView(
                  value: (widget.margin?.bottom ?? 0).toString(),
                  onChanged: (value) {
                    EdgeInsets? update = widget.margin != null ? widget.margin?.copyWith(bottom: double.parse(value)) : EdgeInsets.only(bottom: double.parse(value));
                    widget.onUpdate(widget.padding, update);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldView extends StatelessWidget {
  final String value;
  final Function(String value) onChanged;

  const TextFieldView({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: (value) => onChanged(value),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 12),
      cursorHeight: 12,
      decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none),
    );
  }
}
