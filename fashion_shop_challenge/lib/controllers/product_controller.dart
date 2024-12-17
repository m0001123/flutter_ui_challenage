import 'package:fashion_shop_challenge/datas/product_api.dart';
import 'package:fashion_shop_challenge/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  var productlist = <Product>[].obs; //儲存商品
  var recommendProducts = <Product>[].obs; //儲存推薦商品
  var favoritProducts = <Product>{}.obs; //儲存喜愛商品
  var isLoading = false.obs; //是否加載中
  var currentCategory = '最新上市'.obs; //目前種類
  var productApi = ProductApi();
  var productSize = ['S', 'M', 'L', 'XL'];
  @override
  void onInit() {
    loadproducts(currentCategory.value, true);
    recommendProducts = productlist;
    super.onInit();
  }

  //抓取商品
  Future<void> loadproducts(String category, bool isInit) async {
    if (isLoading.value) return;
    if (isInit) {
      currentCategory.value = category;
      productlist.clear();
    }
    isLoading.value = true;
    final fetchProduct = await productApi.fetchProduct(category);
    var newProduct = fetchProduct.map((product) {
      return Product(
          id: product.id,
          name: product.name,
          price: product.price,
          imglist: product.imglist,
          isfavorite: favoritProducts.contains(product));
    }).toList();
    isLoading.value = false;
    productlist.addAll(newProduct);
  }

  void toggleFavorite(Product product) {}
}
