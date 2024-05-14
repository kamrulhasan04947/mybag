import 'package:flutter/material.dart';

import 'components/app_snackbar_design.dart';

class CustomSnackBar{
  static void cSnackBar({required BuildContext context, required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:  AppSnackBarContent(
          title: 'Congratulation',
          message: message,
        ) ,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
    );
  }
}