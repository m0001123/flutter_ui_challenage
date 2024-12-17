import 'package:fashion_shop_challenge/controllers/base_controller.dart';
import 'package:fashion_shop_challenge/controllers/category_controller.dart';
import 'package:fashion_shop_challenge/controllers/product_controller.dart';
import 'package:fashion_shop_challenge/controllers/shopcar_constroller.dart';
import 'package:fashion_shop_challenge/routes/app_routes.dart';
import 'package:fashion_shop_challenge/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BaseController());
  Get.put(ProductController());
  Get.put(CategoryController());
  Get.put(ShopcarConstroller());
  BaseController.to.initTheme;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: BaseController.to.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: AppRoutes.base,
        getPages: AppRoutes.routes);
  }
}
