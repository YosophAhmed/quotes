import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes/core/utils/app_colors.dart';

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showToast({
    required String message,
    Color? color,
    ToastGravity? toastGravity,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: color ?? AppColors.primary,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
    );
  }
}
