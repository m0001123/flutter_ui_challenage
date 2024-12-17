import 'package:flutter/material.dart';
import 'package:on_boarding_ui_challenage/views/components/intro_content.dart';
import 'package:on_boarding_ui_challenage/views/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          //onboarding ui
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              //intro page1
              const IntroContent(
                imagePath: 'assets/gif/onboarding1.gif',
                title: '歡迎光臨本店',
                subtitle: '你想到的，應該都買得到',
              ),
              //intro page2
              const IntroContent(
                imagePath: 'assets/gif/onboarding2.gif',
                title: '完美的購物體驗',
                subtitle: '在家一鍵迅速下單，免出門也能享受購物的快樂',
              ),
              //intro page3
              const IntroContent(
                imagePath: 'assets/gif/onboarding3.gif',
                title: '迅速到貨',
                subtitle: '今天買，明天到',
              ),
              //enter page
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: SafeArea(
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Image.asset(
                          'assets/gif/welcome.png',
                          height: 300,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage())),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.all(25),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                '開始購物',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //page indicator
          Align(
              alignment: const FractionalOffset(0.5, 0.85),
              child:
                  SmoothPageIndicator(controller: _pageController, count: 4)),

          //skip
          if (currentPage != 3)
            Align(
              alignment: const FractionalOffset(0.9, 0.1),
              child: GestureDetector(
                onTap: () => _pageController.animateToPage(3,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.easeInOut),
                child: Text(
                  'skip',
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
              ),
            ),

          //last page
          if (currentPage != 0)
            Align(
                alignment: const FractionalOffset(0.1, 0.85),
                child: GestureDetector(
                  onTap: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.deepPurple,
                    size: 35,
                  ),
                )),

          //next page
          if (currentPage != 3)
            Align(
                alignment: const FractionalOffset(0.9, 0.85),
                child: GestureDetector(
                  onTap: () => _pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.easeInOut),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.deepPurple, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
