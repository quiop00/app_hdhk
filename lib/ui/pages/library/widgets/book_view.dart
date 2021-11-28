import 'package:app_chua/ui/pages/library/widgets/tab_view.dart';
import 'package:app_chua/ui/widgets/monk_builder.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class BookView extends StatefulWidget {
  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: appHeight - 80,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MonkBuilder(appHeight: appHeight, appWidth: appWidth, onTap: () {}),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: appHeight * 0.7,
              child: ListView.builder(
                  itemCount: 10, itemBuilder: (context, index) => BookItem()),
            ),
          )
        ],
      ),
    );
  }
}

class BookItem extends StatelessWidget {
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
                    Text('Tiêu đề sách',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                    Text('Thiền', style: TextStyle(color: AppColors.blue)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Trí tuệ', style: TextStyle(color: AppColors.blue)),
                    SizedBox(
                      width: 10,
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
