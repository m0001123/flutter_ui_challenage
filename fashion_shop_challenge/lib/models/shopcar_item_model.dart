// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:get/get.dart';

class ShopcarItemModel {
  final Product product;
  RxInt quantity;
  String size;
  ShopcarItemModel({
    required this.product,
    required this.quantity,
    required this.size,
  });
}
