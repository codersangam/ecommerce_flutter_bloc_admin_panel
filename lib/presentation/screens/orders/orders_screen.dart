part of 'orders_imports.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersController ordersController = Get.put(OrdersController());
    return Scaffold(
      appBar: VxAppBar(title: 'Orders Screen'.text.make()),
      body: Column(
        children: [
          Obx(() {
            return ListView.builder(
              itemCount: ordersController.pendingOrders.length,
              itemBuilder: (context, index) {
                return OrderProductCard(
                  orders: ordersController.pendingOrders[index],
                );
              },
            ).expand();
          }),
        ],
      ),
    );
  }
}

class OrderProductCard extends StatefulWidget {
  const OrderProductCard({Key? key, required this.orders}) : super(key: key);

  final Orders orders;

  @override
  State<OrderProductCard> createState() => _OrderProductCardState();
}

class _OrderProductCardState extends State<OrderProductCard> {
  ProductController productController = Get.put(ProductController());
  OrdersController ordersController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    var products = productController.products
        .where((product) => widget.orders.productIds.contains(product.id))
        .toList();
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Order No: #${widget.orders.id}".text.bold.make(),
              DateFormat('dd/MM/yyyy')
                  .format(widget.orders.createdAt)
                  .text
                  .make(),
            ],
          ),
          10.heightBox,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      products[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      products[index].name.text.bold.make(),
                      products[index].details.text.maxLines(2).make(),
                    ],
                  ).expand(),
                  10.heightBox,
                ],
              );
            },
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "SubTotal: ".text.make(),
              "${MyCurrency.value}" " ${widget.orders.subTotal}".text.make(),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total: ".text.bold.make(),
              "${MyCurrency.value}" " ${widget.orders.subTotal}"
                  .text
                  .bold
                  .make(),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.orders.isAccepted
                  ? ElevatedButton(
                      onPressed: () {
                        ordersController.updateOrder(widget.orders,
                            "isDelivered", !widget.orders.isDelivered);
                      },
                      child: "Delivered".text.make(),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        ordersController.updateOrder(widget.orders,
                            "isAccepted", !widget.orders.isAccepted);
                      },
                      child: "Accept".text.make(),
                    ),
              ElevatedButton(
                onPressed: () {
                  ordersController.updateOrder(
                      widget.orders, "isCancelled", !widget.orders.isCancelled);
                },
                child: "Cancel".text.make(),
              ),
            ],
          ),
        ],
      ).p8(),
    );
  }
}
