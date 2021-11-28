import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class OpenWebsiteAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0.0),
      child: Container(
        height: 300,
        color: AppColors.white.withOpacity(0),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              color: AppColors.orange,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                child: Flexible(
                    child: Text(
                  'Mục Hỏi Đáp Phật Pháp sẽ được mở website bên ngoài\nQúy vị có đồng ý không?',
                  maxLines: 3,
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.grey)),
                    child: Text('Tôi đồng ý'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.grey)),
                    child: Text('Tôi muốn quay lại'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
