import 'package:ecommerce_flutter_bloc_admin_panel/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IconCardButton extends StatelessWidget {
  const IconCardButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        child: VxCard(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                color: MyColors.white,
              ),
              10.widthBox,
              title.text.white.makeCentered(),
            ],
          ),
        ).color(MyColors.orange).make(),
      ),
    );
  }
}
