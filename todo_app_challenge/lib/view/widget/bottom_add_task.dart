import 'dart:ui';

import 'package:flutter/material.dart';

class BottomAddTask extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function() addFn;
  final bool isOpen;
  final Function() openSwitch;
  final double width;

  const BottomAddTask({
    super.key,
    required this.textEditingController,
    required this.addFn,
    required this.isOpen,
    required this.openSwitch,
    required this.width,
  });

  @override
  State<BottomAddTask> createState() => _BottomAddTaskState();
}

class _BottomAddTaskState extends State<BottomAddTask> {
  //whether expand

  @override
  Widget build(BuildContext context) {
    double maxWidth = widget.width - 80;
    return Row(
      children: [
        Visibility(
          visible: widget.isOpen,
          child: GestureDetector(
            onTap: widget.openSwitch,
            child: const Icon(
              color: Colors.black45,
              Icons.arrow_forward_ios_rounded,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              height: 50,
              width: widget.isOpen ? maxWidth : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Colors.black.withOpacity(0.7),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white70.withOpacity(0.3),
                    Colors.white70.withOpacity(0.1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 15,
                ),
                child: Visibility(
                  visible: widget.isOpen,
                  child: Center(
                    child: TextField(
                      controller: widget.textEditingController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '輸入代辦事項',
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.isOpen ? widget.addFn : widget.openSwitch,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ],
    );
  }
}
