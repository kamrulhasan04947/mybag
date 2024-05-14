
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybag/models/card_model.dart';
import 'package:mybag/widgits/components/card_quantity_button.dart';
import '../constant/colors.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key, required this.index ,
    required this. orientation,
    required this.screenHeight,
    required this.screenWidth,
    required this.increaseQuantity,
    required this.decreaseQuantity,
  });
  final int index;
  final double screenHeight;
  final double screenWidth;
  final Orientation orientation;
  final Function increaseQuantity;
  final Function decreaseQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(bottom: 30),
       height: (orientation == Orientation.portrait) ? screenHeight * .16 : screenHeight *.4,
       width: screenWidth * .8,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(10)),
         boxShadow: const [
           BoxShadow(
             color: AppColor.grey,
             blurStyle: BlurStyle.normal,
             blurRadius: 10,
             spreadRadius: 2,
             offset: Offset(0, 2),
           )
         ],
       ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height:MediaQuery.of(context).size.height,
            width: (orientation == Orientation.portrait)?
            MediaQuery.of(context).size.width * .34:
            MediaQuery.of(context).size.width * .25,
            decoration: BoxDecoration(
              color: AppColor.grey,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
              image:  DecorationImage(
                  image: NetworkImage(cardContents[index].dressImage),
                  fit: BoxFit.cover
              )
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardContents[index].dressName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text('Color: '),
                                Text(cardContents[index].dressColor),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Size: '),
                                Text(cardContents[index].dressSize),
                              ],
                            )
                          ],
                        ),
                       Icon(
                         Icons.more_vert,
                         color: Colors.grey,
                       )
                      ],
                     )
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CardQuantityButton(
                              icon: Icons.remove,
                              onPressed: (){
                                decreaseQuantity();
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '${cardContents[index].quantity}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 12,),
                            CardQuantityButton(
                              icon: Icons.add,
                              onPressed: (){
                                increaseQuantity();
                              },
                            ),
                          ],
                        ),
                        Text(
                          "${cardContents[index].dressPrice * cardContents[index].quantity}\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )

                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
