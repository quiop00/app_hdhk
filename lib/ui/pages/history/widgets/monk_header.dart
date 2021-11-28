import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class MonkDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ngài Viên Minh',
            style: TextStyle(
                fontSize: 25,
                color: AppColors.orange,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text(
                      'Pháp Thoại',
                      style: TextStyle(color: AppColors.yellow),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text('Thư Viện',
                        style: TextStyle(color: AppColors.yellow))),
                Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text('Hỏi Đáp',
                        style: TextStyle(color: AppColors.yellow))),
                Container(
                    margin: EdgeInsets.only(right: 12),
                    child: Text('Website chùa Bửu Long',
                        style: TextStyle(color: AppColors.yellow))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
