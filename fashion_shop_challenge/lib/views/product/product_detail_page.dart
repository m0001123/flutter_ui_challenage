import 'package:fashion_shop_challenge/controllers/product_controller.dart';
import 'package:fashion_shop_challenge/controllers/shopcar_constroller.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            //商品圖
            Expanded(
              child: ListView.builder(
                  itemCount: product.imglist.length,
                  itemBuilder: (context, index) {
                    return Image.asset(product.imglist[index]);
                  }),
            ),

            //下方商品資訊及添入購物車功能
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 120,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'NT\$ ${product.price}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            height: 325,
                            width: double.infinity,
                            color: Theme.of(context).colorScheme.surface,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Text(
                                    '選擇尺寸',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Text(
                                    '如果您需要幫助，請告知你的尺寸，我們將計算出適合您的尺碼。',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                        fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface)),
                                  child: const Center(
                                    child: Text('找到您的尺碼'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 4,
                                      ),
                                      itemCount: ProductController
                                          .to.productSize.length,
                                      itemBuilder: (context, index) {
                                        bool isLeft = index % 2 == 0; // 偶數為左側
                                        bool isRight = index % 2 == 1; // 奇數為右側
                                        return GestureDetector(
                                          onTap: () {
                                            ShopcarConstroller.to
                                                .addProductToShopCar(
                                                    product,
                                                    ProductController
                                                        .to.productSize[index]);
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: index == 0 || index == 1
                                                    ? BorderSide(
                                                        width: 1,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      )
                                                    : BorderSide.none,
                                                left: isLeft ||
                                                        index == 1 ||
                                                        index == 3
                                                    ? BorderSide
                                                        .none // 左側不設置左邊框
                                                    : BorderSide(
                                                        width: 1,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                right: isRight
                                                    ? BorderSide
                                                        .none // 右側不設置右邊框
                                                    : BorderSide(
                                                        width: 1,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSurface,
                                                      ),
                                                bottom: BorderSide(
                                                  width: 1,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(ProductController
                                                  .to.productSize[index]),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Text(
                                    '查看尺碼',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ));
                        },
                        child: Container(
                          height: 40,
                          width: Get.size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                          child: Center(
                            child: Text(
                              '添加',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                        child: const Center(
                          child: Icon(Icons.bookmark_outline_rounded),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
