import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(title: 'New Product Screen'.text.make()),
    );
  }
}
