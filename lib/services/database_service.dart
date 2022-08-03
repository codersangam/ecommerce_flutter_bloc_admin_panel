import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/data/models/products_model.dart';

class DatabaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return firebaseFirestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromSnapshot(doc);
      }).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return firebaseFirestore.collection('products').add(product.toMap());
  }

  Future<void> updateField(
      Product product, String field, dynamic newValue) async {
    return firebaseFirestore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then(
          (querySnapshot) => querySnapshot.docs.first.reference.update(
            {field: newValue},
          ),
        );
  }
}
