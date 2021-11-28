import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class SmallImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage('assets/background/account_page.png'),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
              decoration:
                  BoxDecoration(color: AppColors.black.withOpacity(0.4)),
              child: Text(
                'Bộ ảnh số 10',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
