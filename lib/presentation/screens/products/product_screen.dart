import 'package:ecommerce_flutter_bloc_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: VxAppBar(
        title: 'Product Screen'.text.make(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Product.products.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  return SizedBox(
                    height: 300,
                    child: ProductCard(
                      product: productController.products[index],
                      index: index,
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          product.name.text.bold.xl2.make(),
          5.heightBox,
          product.details.text.make(),
          5.heightBox,
          Row(
            children: [
              Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        "Price".text.make(),
                        Slider(
                            value: product.price,
                            min: 0,
                            max: 1000,
                            divisions: 50,
                            onChanged: (value) {
                              productController.updateProductPrice(
                                  index, product, value);
                            }),
                        "\$${product.price.toStringAsFixed(1)}".text.make(),
                      ],
                    ),
                    Row(
                      children: [
                        "Quantity".text.make(),
                        Slider(
                            value: product.quantity.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 10,
                            onChanged: (value) {
                              productController.updateProductQuantity(
                                  index, product, value.toInt());
                            }),
                        product.quantity.toInt().text.make(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
