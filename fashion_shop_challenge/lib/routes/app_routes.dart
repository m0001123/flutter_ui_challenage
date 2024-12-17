import 'package:fashion_shop_challenge/views/base/base_page.dart';
import 'package:fashion_shop_challenge/views/shopcar/shop_car_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String base = '/base';
  static const String shopcar = '/shopcar';

  static final routes = [
    GetPage(
      name: '/base',
      page: () => const BasePage(),
      transition: Transition.downToUp,
    ),
    GetPage(
        name: '/shopcar',
        page: () => const ShopCarPage(),
        transition: Transition.downToUp)
  ];
}
