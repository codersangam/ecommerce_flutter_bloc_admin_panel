import 'package:ecommerce_flutter_bloc_admin_panel/data/models/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;

  void updateProductPrice(int index, Product product, double value) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(int index, Product product, int value) {
    product.quantity = value;
    products[index] = product;
  }
}