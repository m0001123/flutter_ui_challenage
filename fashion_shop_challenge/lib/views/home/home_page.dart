import 'package:fashion_shop_challenge/controllers/base_controller.dart';
import 'package:fashion_shop_challenge/controllers/category_controller.dart';
import 'package:fashion_shop_challenge/datas/example.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          scrollDirection: Axis.vertical,
          itemCount: frontcoverList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                CategoryController.to.categorySelected('///最新上市');
                BaseController.to.changePage(2);
              },
              child: Stack(
                children: [
                  //  圖片
                  Image.asset(
                    height: double.infinity,
                    frontcoverList[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                  //漸變遮罩
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // 文字
                  Positioned(
                    bottom: 50,
                    left: 20,
                    right: 20,
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: _currentIndex == index ? 1 : 0,
                      child: Text(
                        frontcoverList[index]['text']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
