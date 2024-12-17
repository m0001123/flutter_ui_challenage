import 'package:fashion_shop_challenge/controllers/product_controller.dart';
import 'package:fashion_shop_challenge/views/product/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = ProductController.to;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.qr_code_scanner),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              //頁面開頭
              Center(
                child: Text(
                  '你在尋找什麼？',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //熱搜關鍵字
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(15, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onPrimary)),
                      child: Center(child: Text('褲子$index')),
                    );
                  }),
                ),
              ),
              //搜尋輸入框
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '請輸入關鍵字',
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                )),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                width: double.infinity,
                child: Text(
                  '你可能會感興趣',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          //商品推薦區
          Obx(() {
            return SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.recommendProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ProductWidget(
                        product: controller.recommendProducts[index]),
                  );
                });
          }),
        ],
      ),
    );
  }
}
