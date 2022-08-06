import 'package:ecommerce_flutter_bloc_admin_panel/data/models/products_model.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final DatabaseService databaseService = DatabaseService();

  var products = <Product>[].obs;

  // List<Product> products = Product.products.obs;

  @override
  void onInit() {
    products.bindStream(databaseService.getProducts());
    super.onInit();
  }

  var newProduct = {}.obs;
  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(int index, Product product, double value) {
    product.price = value.toInt();
    products[index] = product;
  }

  void updateProductQuantity(int index, Product product, int value) {
    product.quantity = value;
    products[index] = product;
  }

  void saveNewProductPrice(Product product, String field, double value) {
    databaseService.updateField(product, field, value);
  }

  void saveNewProductQuantity(Product product, String field, int value) {
    databaseService.updateField(product, field, value);
  }
}
