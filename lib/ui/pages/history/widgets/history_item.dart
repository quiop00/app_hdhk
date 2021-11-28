import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final itemHeight;
  final String imagePath;
  final Color bgColor;
  final String title;
  final String smallText;
  final Function() onTap;
  HistoryItem(
      {required this.imagePath,
      required this.bgColor,
      required this.onTap,
      required this.title,
      this.smallText = '',
      this.itemHeight = 200.0});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: itemHeight,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
          Container(
            height: itemHeight,
            width: width,
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.8),
            ),
          ),
          Positioned(
              bottom: 30,
              left: 24,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 24, color: AppColors.white, height: 1.5),
                  )),
                  Visibility(
                    visible: smallText == '' ? false : true,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Visibility(
                      visible: smallText == '' ? false : true,
                      child: Text(
                        smallText,
                        style: TextStyle(color: AppColors.white),
                      )),
                ],
              )),
          Positioned(
              bottom: smallText == '' ? 35 : 30,
              right: 20,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.white,
              ))
        ],
      ),
    );
  }
}
