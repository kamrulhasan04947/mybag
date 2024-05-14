
import 'package:flutter/material.dart';

class AppSnackBarContent extends StatelessWidget {
  const AppSnackBarContent({
    super.key,
    required this.title,
    required this.message,
  });
  final String title, message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight:FontWeight.w600,
              fontSize:18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}
