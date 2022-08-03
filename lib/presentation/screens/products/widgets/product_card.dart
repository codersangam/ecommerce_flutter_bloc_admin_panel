part of 'widgets_imports.dart';

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
          10.heightBox,
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
                        "Price".text.bold.make(),
                        Slider(
                          value: product.price,
                          min: 0,
                          max: 1000,
                          divisions: 50,
                          onChanged: (value) {
                            productController.updateProductPrice(
                                index, product, value);
                          },
                          onChangeEnd: (value) => productController
                              .saveNewProductPrice(product, 'price', value),
                        ),
                        "\$${product.price.toStringAsFixed(1)}".text.make(),
                      ],
                    ),
                    Row(
                      children: [
                        "Quantity".text.bold.make(),
                        Slider(
                          value: product.quantity.toDouble(),
                          min: 0,
                          max: 100,
                          divisions: 10,
                          onChanged: (value) {
                            productController.updateProductQuantity(
                                index, product, value.toInt());
                          },
                          onChangeEnd: (value) =>
                              productController.saveNewProductQuantity(
                                  product, 'quantity', value.toInt()),
                        ),
                        product.quantity.toInt().text.make(),
                      ],
                    ),
                  ],
                ).pOnly(left: 5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
