import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInFaceBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: AppColors.white, fontSize: 18)),
              backgroundColor: MaterialStateProperty.all<Color>(AppColors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)))),
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook_outlined,
                  size: 40,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('Sign in with Facebook')
              ],
            ),
          )),
    );
  }
}
