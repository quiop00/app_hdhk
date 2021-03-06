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
                    Text('Ti??u ????? s??ch',
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
                        'D???ch v??? mi???n ph?? c???a Google d???ch nhanh c??c t???, c???m t??? v?? trang web gi???a ti???ng Vi???t v?? h??n 100 ng??n ng??? kh??c')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Thi???n', style: TextStyle(color: AppColors.blue)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Tr?? tu???', style: TextStyle(color: AppColors.blue)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Tri th???c', style: TextStyle(color: AppColors.blue))
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
