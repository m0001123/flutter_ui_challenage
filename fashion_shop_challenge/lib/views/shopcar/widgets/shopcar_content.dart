import 'package:fashion_shop_challenge/controllers/shopcar_constroller.dart';
import 'package:fashion_shop_challenge/views/shopcar/widgets/shopcar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShopcarContent extends StatelessWidget {
  ShopcarContent({super.key});
  final controller = ShopcarConstroller.to;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Obx(() {
          //無商品時顯示內容
          if (controller.shopcarProducts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('您的購物袋是空的'),
                  Text('您添加的商品會顯示在此處'),
                ],
              ),
            );
          }
          //商品內容
          return ListView.builder(
              itemCount: controller.shopcarProducts.length,
              itemBuilder: (context, index) {
                return ShopcarItemWidget(
                    addQuantity: () => controller.addProductQuantity(index),
                    minusQuantity: () => controller.minusProductQuantity(index),
                    removeProduct: () =>
                        controller.removeProductToShopCar(index),
                    product: controller.shopcarProducts[index]);
              });
        })),
        //底部結帳區
        Obx(() {
          String formattedPrice =
              NumberFormat("#,##0").format(controller.total.value);
          return SafeArea(
            child: Visibility(
              visible: controller.total.value != 0,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface))),
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('總金額'),
                          Text('NT\$ $formattedPrice')
                        ],
                      ),
                      const Text('含稅'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                        width: double.infinity,
                        child: const Center(
                          child: Text('結帳'),
                        ),
                      )
                    ],
                  )),
            ),
          );
        }),
      ],
    );
  }
}
