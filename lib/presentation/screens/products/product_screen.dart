import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: 'Product Screen'.text.make()),
    );
  }
}
