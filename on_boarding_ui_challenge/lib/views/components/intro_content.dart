import 'package:flutter/material.dart';
import 'package:on_boarding_ui_challenage/views/components/fade_animation_widget.dart';

class IntroContent extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const IntroContent(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subtitle});

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            //intro image
            FadeTransition(
                opacity: _fadeAnimation, child: Image.asset(widget.imagePath)),
            const SizedBox(
              height: 25,
            ),
            //intro title
            FadeAnimationWidget(
              child: Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //intro subtitle
            FadeAnimationWidget(
              delay: const Duration(milliseconds: 200),
              child: Text(
                widget.subtitle,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
