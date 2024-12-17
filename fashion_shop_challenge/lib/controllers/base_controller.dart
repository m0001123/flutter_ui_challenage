import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController with WidgetsBindingObserver {
  static BaseController get to => Get.find();
  RxInt currentPage = 0.obs;

  final isDarkMode = true.obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    initTheme();
    super.onInit();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    initTheme();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void initTheme() {
    final Brightness systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDarkMode.value = systemBrightness == Brightness.dark;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  //切換頁面
  void changePage(int index) {
    if (index == 3) {
      Get.toNamed('/shopcar');
    } else {
      currentPage.value = index;
    }
  }
}
