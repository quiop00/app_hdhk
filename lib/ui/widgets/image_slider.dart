import 'package:app_chua/ui/widgets/list_image.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white, width: 3),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/background/account_page.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    color: AppColors.grey.withOpacity(0.8),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Đây là caption bức hình và bạn có thể ghi bất cứ thứ gì',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 25,
                child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text('Ảnh trong bài'), Text('1/12')],
                        ),
                      ),
                      ListImage()
                    ],
                  ),
                ))
          ],
        ));
  }
}
