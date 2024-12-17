import 'package:fashion_shop_challenge/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find<CategoryController>();
  RxInt tabBarIndex = 0.obs;
  var tabBarCategory = ['女士', '男士', '童裝'];
  var womenCategory = [
    '///  新品上市',
    '上衣',
    '外套',
    '洋裝',
    '褲裝',
    '裙子',
    '香水',
    '配件及首飾'
  ];
  var manCategory = ['///  新品上市', '上衣', '外套', '西裝', '褲裝', '背包', '配飾及香水'];
  var childCategory = ['男童', '女童'];

  //切換頁面上tabBar種類
  void changeTabBarCategory(int index) {
    tabBarIndex.value = index;
  }

  //選擇類別
  void categorySelected(String category) {
    ProductController.to.loadproducts(category, true);
    Get.offNamedUntil(
      '/product',
      ModalRoute.withName('/'), // 清空嵌套路由堆疊
      id: 2, // 嵌套導航 ID
    );
  }
}
