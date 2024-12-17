import 'package:fashion_shop_challenge/views/menu/widgets/category_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop_challenge/controllers/category_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  final CategoryController controller = CategoryController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: DefaultTabController(
          length: controller.tabBarCategory.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              //tabBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.only(right: 55),
                    dividerHeight: 0,
                    indicatorColor: Theme.of(context).colorScheme.onSurface,
                    unselectedLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18),
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    tabs: controller.tabBarCategory
                        .map(
                          (name) => Tab(
                            text: name,
                          ),
                        )
                        .toList()),
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                height: 2,
              ),

              //種類內容
              Expanded(
                child: TabBarView(children: [
                  CategoryView(
                      controller: controller, list: controller.womenCategory),
                  CategoryView(
                      controller: controller, list: controller.manCategory),
                  CategoryView(
                      controller: controller, list: controller.childCategory),
                ]),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Fashion',
                    style: GoogleFonts.dmSerifText(fontSize: 28),
                  )),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'copy right',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
