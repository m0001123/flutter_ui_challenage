import 'package:flutter/material.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text('您的收藏夾是空的'),
            Text('您收藏的商品會顯示在此處'),
          ],
        ),
      ),
    );
  }
}
