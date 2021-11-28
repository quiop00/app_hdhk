import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class ScripturesView extends StatelessWidget {
  final widgetHeight;
  ScripturesView({@required this.widgetHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: widgetHeight,
      child: ListView.builder(
          itemCount: 6, itemBuilder: (context, index) => ScriptureItem()),
    );
  }
}

class ScriptureItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('assets/background/account_page.png'),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Container(
            height: 120,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Trường Bộ Kinh',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Icon(Icons.bookmark_border)],
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Text(
                        'Dịch vụ miễn phí của Google dịch nhanh các từ, cụm từ và trang web giữa tiếng Việt và hơn 100 ngôn ngữ khác')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Thiền',
                      style: TextStyle(color: AppColors.blue),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Trí tuệ', style: TextStyle(color: AppColors.blue)),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Tri thức', style: TextStyle(color: AppColors.blue))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
