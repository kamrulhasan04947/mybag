import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybag/constant/colors.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.orientation
  });
  final String title , content;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      contentPadding: EdgeInsets.all(24),
      actionsAlignment: MainAxisAlignment.center,
      elevation: 2.0,
      shadowColor: AppColor.lightGrey,
      actions: [
        SizedBox(
          width: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.4,
          height: (orientation == Orientation.portrait)
              ? MediaQuery.of(context).size.height * 0.06
              : MediaQuery.of(context).size.height * 0.12,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text(
                'OKAY',
                 style: TextStyle(
                   fontSize: 18,
                   color: Colors.white,
                 ),
            ),
          ),
        )
      ],
    );
  }
}
