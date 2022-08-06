import 'package:ecommerce_flutter_bloc_admin_panel/data/models/orders_model.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/services/database_service.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  final DatabaseService databaseService = DatabaseService();

  var orders = <Orders>[].obs;
  var pendingOrders = <Orders>[].obs;

  @override
  void onInit() {
    orders.bindStream(databaseService.getOrders());
    pendingOrders.bindStream(databaseService.getPendingOrders());
    super.onInit();
  }

  void updateOrder(Orders order, String field, bool newValue) {
    databaseService.updateOrder(order, field, newValue);
  }
}
