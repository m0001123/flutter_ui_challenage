import 'package:flutter/material.dart';

class FadeAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration delay;
  FadeAnimationWidget(
      {super.key,
      required this.child,
      this.delay = const Duration(milliseconds: 0)});

  @override
  _FadeAnimationWidgetState createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<FadeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    Future.delayed(widget.delay, () {
      if (mounted) _animationController.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: widget.child));
  }
}
