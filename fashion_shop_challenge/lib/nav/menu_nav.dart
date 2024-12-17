import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:fashion_shop_challenge/views/menu/menu_page.dart';
import 'package:fashion_shop_challenge/views/product/product_detail_page.dart';
import 'package:fashion_shop_challenge/views/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({super.key});
  //嵌入式路由
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(2),
      onGenerateRoute: (settings) {
        if (settings.name == '/product') {
          return GetPageRoute(
              settings: settings, page: () => const ProductPage());
        } else if (settings.name == '/product_detail') {
          return GetPageRoute(
              settings: settings,
              page: () =>
                  ProductDetailPage(product: settings.arguments as Product));
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => MenuPage(),
          );
        }
      },
    );
  }
}
