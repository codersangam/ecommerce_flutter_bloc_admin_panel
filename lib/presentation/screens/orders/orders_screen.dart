part of 'orders_imports.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: 'Orders Screen'.text.make()),
      body: Column(
        children: [
          ListView.builder(
            itemCount: Orders.orders.length,
            itemBuilder: (context, index) {
              return OrderProductCard(
                orders: Orders.orders[index],
              );
            },
          ).expand(),
        ],
      ),
    );
  }
}

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({Key? key, required this.orders}) : super(key: key);

  final Orders orders;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          "${orders.id}".text.make(),
        ],
      ),
    );
  }
}
