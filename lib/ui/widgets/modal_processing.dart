import 'package:flutter/material.dart';

void showLoading(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: 100,
          child: Dialog(
            child: CircularProgressIndicator(),
          ),
        );
      });
}
