import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ProductApi extends GetConnect {
  //模擬網路抓取資料
  Future<List<Product>> fetchProduct(String category) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final String response = await rootBundle.loadString('assets/product.json');
    final List jsonData = json.decode(response);
    return jsonData.map((element) => Product.fromMap(element)).toList();
  }
}
