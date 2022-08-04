import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter_bloc_admin_panel/presentation/routes/router_imports.gr.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VxAppBar(
        title: 'Food Cruch Admin Panel'.text.make(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(const ProductScreenRoute());
            },
            child: VxCard(
              "Go to Products"
                  .text
                  .xl2
                  .makeCentered()
                  .wh(MediaQuery.of(context).size.width, 100),
            ).makeCentered().pSymmetric(h: 15),
          ),
          20.heightBox,
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(const OrdersScreenRoute());
            },
            child: VxCard(
              "Go to Orders"
                  .text
                  .xl2
                  .makeCentered()
                  .wh(MediaQuery.of(context).size.width, 100),
            ).makeCentered().pSymmetric(h: 15),
          ),
        ],
      ),
    );
  }
}
