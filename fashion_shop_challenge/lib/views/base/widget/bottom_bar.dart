import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int selected;
  final List<Widget> items;
  final Function(int) ontap;
  const BottomBar({
    required this.selected,
    required this.items,
    required this.ontap,
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int selected;

  //計算指示器移動距離
  double calculatePadding(Size size, int selected, int length) {
    double padding = (((size.width - 150) / length) / 2) +
        ((size.width - 150) / length + 30) * selected +
        15 -
        5;
    return padding;
  }

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BottomBar oldWidget) {
    if (oldWidget.selected != widget.selected) {
      selected = widget.selected;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Theme.of(context).colorScheme.onSurface))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //bottombar Item
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    if (selected != entry.key) {
                      widget.ontap(entry.key);
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: FittedBox(child: entry.value),
                  ),
                );
              }).toList()),

          //指示器
          AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.decelerate,
            padding: EdgeInsets.only(
              left: calculatePadding(size, selected, 5),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              color: Theme.of(context).colorScheme.onSurface,
              height: 3,
              width: 10,
            ),
          )
        ],
      ),
    );
  }
}
