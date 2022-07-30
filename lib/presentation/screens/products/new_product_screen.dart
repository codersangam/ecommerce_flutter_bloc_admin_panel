part of 'product_imports.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: 'New Product Screen'.text.make()),
      body: SingleChildScrollView(
        reverse: true,
        child: Obx(() {
          return Column(
            children: [
              IconCardButton(
                title: "Add Image",
                onTap: () {
                  Utils.pickedImage(context);
                },
              ),
              _buildTextFormField("Product Id", 'id', productController),
              _buildTextFormField("Product Name", 'name', productController),
              _buildTextFormField(
                  "Product Description", 'description', productController),
              _buildTextFormField(
                  "Product Category", 'category', productController),
              _buildSlider(
                  "Price", "price", productController, productController.price),
              _buildSlider("Quantity", "quantity", productController,
                  productController.quantity),
              _buildCheckBox("Popular", "isPopular", productController,
                  productController.isPopular),
              _buildCheckBox("Recommended", "isRecommended", productController,
                  productController.isRecommended),
              20.heightBox,
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: MyColors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    print(productController.newProduct);
                  },
                  child: "Save".text.color(MyColors.white).xl2.make(),
                ),
              ),
            ],
          ).pSymmetric(h: 10);
        }),
      ),
    );
  }

  Row _buildCheckBox(String title, String name,
      ProductController productController, bool? controllerValue) {
    return Row(
      children: [
        title.text.bold.xl.make(),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
        ),
      ],
    );
  }

  Row _buildSlider(String title, String name,
      ProductController productController, double? controllerValue) {
    return Row(
      children: [
        title.text.bold.make(),
        Slider(
          value: (controllerValue == null) ? 0 : controllerValue,
          min: 0,
          max: 1000,
          divisions: 50,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
        ).expand(),
      ],
    );
  }

  TextFormField _buildTextFormField(
    String label,
    String name,
    ProductController productController,
  ) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      onChanged: (value) {
        productController.newProduct
            .update(name, (_) => value, ifAbsent: () => value);
      },
    );
  }
}
