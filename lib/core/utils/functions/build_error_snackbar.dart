import 'package:flutter/material.dart';

SnackBar buildErrorSnackbar(String errMessage, BuildContext context) {
  return SnackBar(
    content: Row(
      children: [
        Icon(Icons.error_outline, color: Colors.white),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            errMessage,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.all(16),
    duration: Duration(seconds: 4),
    action: SnackBarAction(
      label: 'DISMISS',
      textColor: Colors.red,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );
}
