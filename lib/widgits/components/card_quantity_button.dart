import 'package:mybag/constant/colors.dart';
import 'package:flutter/material.dart';

class CardQuantityButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CardQuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.softGrey,
            blurStyle: BlurStyle.normal,
            blurRadius: 15,
            spreadRadius: 5,
            offset: Offset(0, 10),
          )
        ],
      ),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () => onPressed(),
        icon: Icon(
          icon,
          color: AppColor.darkGrey,
          size: 32,
        ),
      ),
    );
  }
}
