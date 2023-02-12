import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ShoppingController extends GetxController{
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResults = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productImage: 'lib/images/apple.jpg',
        productName: 'apple',
      ),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'lib/images/banana.jpg',
          productName: 'bananas'),
      Product(
          id: 3,
          price: 50,
          productDescription: 'some description about product',
          productImage: 'lib/images/orange 1.jpg',
          productName: 'oranges'),
    ];

    products.value = productResults;

  }


}