import 'package:flutter/material.dart';

class TaskTitle extends StatefulWidget {
  final bool isComplete;
  final Function(bool?)? checkChange;
  final String title;
  final Function()? deleteFn;
  const TaskTitle({
    super.key,
    required this.checkChange,
    required this.title,
    required this.isComplete,
    this.deleteFn,
  });

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  //滑動最大距離
  var maxSlideDistance = 50.0;
  //是否滑動
  bool isSlid = false;

  //completeshadow
  var completeShadow = [
    const BoxShadow(
        offset: Offset(-1, -1), color: Colors.black12, spreadRadius: 3),
    const BoxShadow(
      color: Colors.white,
      spreadRadius: 1,
      blurRadius: 2,
      offset: Offset(3, 3),
    ),
  ];
  //No Complete Shadow
  var noCompleteShadow = [
    BoxShadow(
      offset: const Offset(4, 4),
      color: Colors.grey[500]!,
      blurRadius: 10,
    ),
    const BoxShadow(
      color: Colors.white,
      blurRadius: 10,
      offset: Offset(-4, -4),
    )
  ];

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0.0, end: maxSlideDistance)
        .animate(_animationController);

    super.initState();
  }

  //根據使用著滑動程度更新動畫
  void onHorizontalUpdate(DragUpdateDetails detail) {
    double delta = detail.primaryDelta ?? 0; //ˊ獲取滑動值
    double progress =
        _animationController.value - delta / maxSlideDistance; //計算動畫進度
    _animationController.value = progress.clamp(0.0, 1.0);
  }

  // 根據手勢結束時的速度來決定打開還是關閉
  void onHorizontalEnd(DragEndDetails details) {
    if (details.primaryVelocity! > 250) {
      _animationController.reverse(); // 向右滑動時收回
      isSlid = false;
    } else if (details.primaryVelocity! < -250) {
      _animationController.forward(); // 向左滑動時打開
      isSlid = true;
    } else {
      if (_animationController.value > 0.5) {
        _animationController.forward();
        isSlid = true;
      } else {
        _animationController.reverse();
        isSlid = false;
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => onHorizontalUpdate(details),
      onHorizontalDragEnd: (details) => onHorizontalEnd(details),
      onTap: () {
        if (isSlid) {
          _animationController.reverse();
          isSlid = false;
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            right: 0,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.only(right: 15),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: widget.deleteFn,
                child: const Icon(
                  Icons.delete_forever_rounded,
                  size: 35,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-_animation.value, 0),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow:
                        widget.isComplete ? completeShadow : noCompleteShadow,
                  ),
                  child: ListTile(
                    title: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 100),
                      style: TextStyle(
                        color:
                            widget.isComplete ? Colors.grey[700] : Colors.black,
                        decoration: widget.isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      child: Text(widget.title),
                    ),
                    leading: Checkbox(
                      activeColor: Colors.green,
                      onChanged: widget.checkChange,
                      value: widget.isComplete,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
