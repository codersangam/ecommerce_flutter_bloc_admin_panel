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
    var products = Product.products
        .where((product) => orders.productIds.contains(product.id))
        .toList();
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Order No: ${orders.id}".text.bold.make(),
              DateFormat('dd/MM/yyyy').format(orders.createdAt).text.make(),
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
              orders.subTotal.text.make(),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Total: ".text.bold.make(),
              orders.subTotal.text.bold.make(),
            ],
          ),
          10.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: "Accept".text.make(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: "Cancel".text.make(),
              ),
            ],
          ),
        ],
      ).p8(),
    );
  }
}
