
import 'package:flutter/material.dart';
import 'package:mybag/constant/colors.dart';


class BottomLayout extends StatelessWidget {
  final Orientation orientation;
  final double screenHeight, screenWidth;
  final Function onPressed;
  final int totalPrice;

  const BottomLayout({
    super.key,
    required this.orientation,
    required this.screenHeight,
    required this.screenWidth,
    required this.onPressed,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: (orientation == Orientation.portrait)
            ? screenHeight * 0.11
            : screenHeight * 0.22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Text("Total amount",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.darkGrey,
                            fontSize: 14,
                        ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text("${totalPrice.toString()}\$",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                        ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: (orientation == Orientation.portrait) ? 12 : 10,
            ),
            Center(
              child: SizedBox(
                width: (orientation == Orientation.portrait)
                    ? double.infinity
                    : MediaQuery.of(context).size.width * 0.4,
                height: (orientation == Orientation.portrait)
                    ? MediaQuery.of(context).size.height * 0.06
                    : MediaQuery.of(context).size.height * 0.12,
                child: ElevatedButton(
                  onPressed: () => onPressed(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ) ,
                  child: const Text('CHECK OUT'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}