import 'package:flutter/material.dart';
import 'package:mybag/controllers/card_controller.dart';
import 'package:mybag/models/card_model.dart';
import 'package:mybag/widgits/components/alart_daialog.dart';

import '../widgits/cart.dart';
import '../widgits/components/bottom_layout.dart';
import '../widgits/customSnackBar.dart';

class BageScreen extends StatefulWidget {
  const BageScreen({super.key});

  @override
  State<BageScreen> createState() => _BageScreenState();
}

class _BageScreenState extends State<BageScreen> {
  late double screenHeight, screenWidth;
  late CardController cardController;
  late int totalPrice;
  @override
  void initState(){
    cardController = CardController();
    totalPrice = cardController.totalPrice(cardContents);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: OrientationBuilder(builder: (BuildContext context, Orientation orientation){
        return (orientation == Orientation.portrait) ? potraitView(orientation): landscapeView(orientation);
      }),
    );
  }

  Widget potraitView(Orientation pageOrientation ) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MyBag',
            style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
              child: ListView.builder(
                itemCount: cardContents.length,
                itemBuilder: (context, index){
                  return ItemCart(
                    index: index,
                    orientation: pageOrientation,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    increaseQuantity: () => increaseItem(index, pageOrientation),
                    decreaseQuantity: () => decreaseItem(index),
                  );
                },
              )
          ),
          BottomLayout(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                orientation: pageOrientation,
                onPressed: (){
                  CustomSnackBar.cSnackBar(
                      context: context,
                      message: 'Checkout successful. Thank you for shopping.'
                  );
                },
                totalPrice: totalPrice,
          ),

        ],
      ),
    );
  }

  Widget landscapeView(Orientation pageOrientation ) {
    return Container(
      margin: const EdgeInsets.all(10.00),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth * .6,
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MyBag',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: cardContents.length,
                      itemBuilder: (context, index){
                        return ItemCart(
                          index: index,
                          orientation: pageOrientation,
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          increaseQuantity: () => increaseItem(index, pageOrientation),
                          decreaseQuantity: () => decreaseItem(index),
                        );
                      },
                    )
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * .05,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: screenWidth* .28,
              height: screenHeight,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomLayout(
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    orientation: pageOrientation,
                    onPressed: (){
                      CustomSnackBar.cSnackBar(
                          context: context,
                          message: 'Checkout successful. Thank you for shopping.'
                      );
                    },
                    totalPrice: totalPrice,
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }


  void increaseItem(int index, Orientation orientation){
    totalPrice = cardController.increaseQuantity(totalPrice, index, cardContents);
    if(cardContents[index].quantity >= 5){
      showDialogAlert(
        index,
        orientation
      );
    }
    setState(() {});
  }

  void decreaseItem(int index){
    totalPrice = cardController.decreaseQuantity(totalPrice, index, cardContents);
    setState(() {});
  }

  void showDialogAlert(int index, Orientation orientation){
      String item = cardContents[index].dressName;
      String itemCount = cardContents[index].quantity.toString();
      showDialog(
          context: context,
          builder: (context){
            return AppAlertDialog(
                title: 'Congratulation',
                content: 'You have added\n $itemCount \n$item on your bag',
                orientation: orientation
            );
          }
      );
  }

}