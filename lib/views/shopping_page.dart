import 'package:cartapp/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller/cart_controller.dart';
import 'cart_page.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[200],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index){
                        return Container(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                //set border radius more than 50% of height and width to make circle
                              ),
                            margin: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image.asset(controller.products[index].productImage),
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(37), // Image radius
                                      child: Image.asset(controller.products[index].productImage,
                                        fit: BoxFit.cover,),
                                    ),
                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('${controller.products[index].productName}',
                                          style: TextStyle(fontSize: 24),
                                          ),
                                          Text('${controller.products[index].productDescription}'),
                                        ],
                                      ),
                                      Text('\$${controller.products[index].price}',
                                      style: TextStyle(fontSize: 24),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      cartController.addToCart(controller.products[index]);
                                    },
                                    child: Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        );
                      },
                  );
                }
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text('Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 25, color: Colors.white),);
              }
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => CartPage(),
    )
    );
    },
                icon: Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.orangeAccent,),
                label: GetX<CartController>(
                  builder: (controller) {
                    return Text(controller.count.toString(),
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 20,));
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
