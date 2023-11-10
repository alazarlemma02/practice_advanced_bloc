import 'package:flutter/material.dart';

class SnackbarMsg {
  const SnackbarMsg({
    required this.context,
  });
  final BuildContext context;

  showSnackBar(
      String message, Color backColor, Color textColor, int totalTime) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: totalTime),
        content: Center(
          child: Text(
            message,
            style: TextStyle(fontSize: 14, color: textColor),
          ),
        ),
        backgroundColor: backColor,
      ),
    );
  }
}
