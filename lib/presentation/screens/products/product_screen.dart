part of 'product_imports.dart';

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
          IconCardButton(
            title: "Add New Product",
            onTap: () =>
                AutoRouter.of(context).push(const NewProductScreenRoute()),
          ),
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
