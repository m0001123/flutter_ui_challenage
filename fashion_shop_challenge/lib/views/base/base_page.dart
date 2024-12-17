import 'package:fashion_shop_challenge/controllers/base_controller.dart';
import 'package:fashion_shop_challenge/controllers/shopcar_constroller.dart';
import 'package:fashion_shop_challenge/nav/menu_nav.dart';
import 'package:fashion_shop_challenge/views/base/widget/bottom_bar.dart';
import 'package:fashion_shop_challenge/views/home/home_page.dart';
import 'package:fashion_shop_challenge/views/search/search_page.dart';
import 'package:fashion_shop_challenge/views/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        //page body
        body: Obx(() {
          return IndexedStack(
            index: BaseController.to.currentPage.value,
            children: [
              const HomePage(),
              const SearchPage(),
              const MenuNav(),
              Container(color: Colors.yellow),
              const SettingPage(),
            ],
          );
        }),
        //bottomebar
        bottomNavigationBar: Obx(() {
          return BottomBar(
            ontap: (index) => BaseController.to.changePage(index),
            selected: BaseController.to.currentPage.value,
            items: [
              const Icon(
                Icons.home_outlined,
              ),
              const Icon(Icons.search_outlined),
              const Text(
                '菜單',
              ),
              Badge(
                isLabelVisible:
                    ShopcarConstroller.to.shopcarProducts.isNotEmpty,
                child: const Icon(
                  Icons.shopping_bag_outlined,
                ),
              ),
              const Icon(Icons.person_outline),
            ],
          );
        }));
  }
}
