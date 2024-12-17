import 'package:fashion_shop_challenge/controllers/product_controller.dart';
import 'package:fashion_shop_challenge/views/product/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = ProductController.to;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          //判斷是否滑動到底部 實踐load more 功能
          if (notification.metrics.pixels >=
                  notification.metrics.maxScrollExtent &&
              notification is ScrollEndNotification) {
            controller.loadproducts(controller.currentCategory.value, false);
          }
          return false;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                controller.currentCategory.value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value &&
                    controller.productlist.isEmpty) {
                  // 初次加載顯示加載動畫
                  return Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ));
                }
                return CustomScrollView(
                  slivers: [
                    SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: controller.productlist.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/product_detail',
                                  id: 2,
                                  arguments: controller.productlist[index]);
                            },
                            child: ProductWidget(
                                product: controller.productlist[index]),
                          );
                        }),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 25),
                        child: controller.isLoading.value
                            ? Center(
                                child: Text(
                                  '加載中',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
