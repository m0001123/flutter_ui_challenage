// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fashion_shop_challenge/models/shopcar_item_model.dart';
import 'package:get/get.dart';

class ShopcarItemWidget extends StatelessWidget {
  final ShopcarItemModel product;
  final Function() removeProduct;
  final Function() addQuantity;
  final Function() minusQuantity;
  const ShopcarItemWidget({
    super.key,
    required this.product,
    required this.removeProduct,
    required this.addQuantity,
    required this.minusQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onSurface, width: 1)),
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //商品圖
            Flexible(
              flex: 1,
              child: Image.asset(
                product.product.imglist[0],
              ),
            ),
            //商品詳情
            Flexible(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: removeProduct, child: const Icon(Icons.close)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(product.product.name),
                    Text('NT\$ ${product.product.price}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${product.size} 號'),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                        height: 30,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    onTap: addQuantity,
                                    child: const Icon(Icons.add_outlined))),
                            const VerticalDivider(),
                            Obx(() {
                              return Expanded(
                                flex: 1,
                                child:
                                    Center(child: Text('${product.quantity}')),
                              );
                            }),
                            const VerticalDivider(),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                    onTap: minusQuantity,
                                    child: const Icon(Icons.remove_outlined))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
