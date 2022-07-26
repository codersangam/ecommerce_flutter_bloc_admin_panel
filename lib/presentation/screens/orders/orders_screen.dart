import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: 'Orders Screen'.text.make()),
    );
  }
}
