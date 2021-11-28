import 'package:app_chua/ui/pages/library/library_detail_page.dart';
import 'package:app_chua/ui/pages/library/widgets/tab_view.dart';
import 'package:app_chua/ui/widgets/monk_builder.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PoemView extends StatefulWidget {
  @override
  _PoemViewState createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Container(
      height: appHeight - 80,
      color: AppColors.white,
      child: Column(
        children: [
          Expanded(
              child: Container(
            height: appHeight * 0.7,
            child: ListView.builder(
                itemCount: 10, itemBuilder: (context, index) => PoemItem()),
          ))
        ],
      ),
    );
  }
}

class PoemItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) => LibraryDetailPage()));
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage('assets/background/account_page.png'),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Tựa đề bài viết',
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
                    Text('12/10/2020',
                        style:
                            TextStyle(color: AppColors.yellow, fontSize: 12)),
                    Expanded(
                        child: Text(
                            'Dịch vụ miễn phí của Google dịch nhanh các từ, cụm từ và trang web giữa tiếng Việt')),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
