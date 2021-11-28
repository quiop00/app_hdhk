import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatelessWidget {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                    child: Text('Qúy vị vui lòng chọn nhóm nội dung cần tìm'),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          leading: Radio(
                            value: true,
                            onChanged: (value) {},
                            groupValue: true,
                          ),
                          title: Text('Khóa Thiền'),
                        ),
                        ListTile(
                          leading: Radio(
                            value: true,
                            onChanged: (value) {},
                            groupValue: true,
                          ),
                          title: Text('Pháp Thọai'),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.grey)),
                child: Text('HIỂN THỊ'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
