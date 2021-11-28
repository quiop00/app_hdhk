import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(0.0),
      child: Container(
        height: 250,
        color: AppColors.white.withOpacity(0),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.orange,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 3, bottom: 3),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Nhập nội dung bạn muốn tìm kiếm...'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        leading: Radio(
                          value: true,
                          onChanged: (value) {},
                          groupValue: true,
                        ),
                        title: Text('Tác giả'),
                      ),
                      ListTile(
                        leading: Radio(
                          value: false,
                          onChanged: (value) {},
                          groupValue: true,
                        ),
                        title: Text('Nội dung'),
                      ),
                      ListTile(
                        leading: Radio(
                          value: false,
                          onChanged: (value) {},
                          groupValue: true,
                        ),
                        title: Text('Bất kỳ'),
                      )
                    ],
                  ),
                ))
              ],
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
                child: Text('Tìm kiếm'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
