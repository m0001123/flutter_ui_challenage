import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:fashion_shop_challenge/models/shopcar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopcarConstroller extends GetxController {
  static ShopcarConstroller get to => Get.find();
  PageController pageController = PageController();
  var shopcarProducts = <ShopcarItemModel>[].obs;
  var total = 0.obs;
  var tabTitle = ['購物袋', '收藏夾'];
  var currentTab = 0.obs;

  //tabbar 切換
  void changeTab(int index) {
    currentTab.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  // 新增商品至購物袋
  void addProductToShopCar(Product product, String size) {
    // 檢查是否已有相同的商品和尺寸
    final existingIndex = shopcarProducts.indexWhere(
      (item) => item.product.id == product.id && item.size == size,
    );
    if (existingIndex != -1) {
      addProductQuantity(existingIndex);
    } else {
      shopcarProducts
          .add(ShopcarItemModel(product: product, quantity: 1.obs, size: size));
    }
    calculateTotal();
  }

  //刪除購物袋商品
  void removeProductToShopCar(int index) {
    shopcarProducts.removeAt(index);
    calculateTotal();
  }

  //增加購物袋內商品的數量
  void addProductQuantity(int index) {
    shopcarProducts[index].quantity.value += 1;
    calculateTotal();
  }

  //減少購物袋內商品的數量
  void minusProductQuantity(int index) {
    shopcarProducts[index].quantity.value -= 1;
    if (shopcarProducts[index].quantity.value == 0) {
      removeProductToShopCar(index);
    }
    calculateTotal();
  }

  //計算總額
  void calculateTotal() {
    var tmp = 0;
    for (var item in shopcarProducts) {
      tmp += item.product.price * item.quantity.value;
    }
    total.value = tmp;
  }
}
