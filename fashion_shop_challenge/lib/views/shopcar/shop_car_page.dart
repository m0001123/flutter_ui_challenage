import 'package:fashion_shop_challenge/controllers/shopcar_constroller.dart';
import 'package:fashion_shop_challenge/views/shopcar/widgets/favorite_content.dart';
import 'package:fashion_shop_challenge/views/shopcar/widgets/shopcar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCarPage extends StatelessWidget {
  const ShopCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = ShopcarConstroller.to;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.close_outlined),
          onTap: () {
            Get.back();
            controller.currentTab.value = 0;
          },
        ),
      ),
      body: Column(
        children: [
          // 上方tabBar
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1),
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 1))),
            child: Obx(() {
              return Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      controller.changeTab(0);
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '購物袋',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: controller.currentTab.value == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  )),
                  VerticalDivider(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      controller.changeTab(1);
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          '收藏夾',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: controller.currentTab.value == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ))
                ],
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          //內容
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.currentTab.value = value;
              },
              children: [
                ShopcarContent(),
                const FavoriteContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
