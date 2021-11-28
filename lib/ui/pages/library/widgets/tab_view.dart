import 'package:app_chua/ui/pages/library/widgets/book_view.dart';
import 'package:app_chua/ui/pages/library/widgets/poem_view.dart';
import 'package:app_chua/ui/pages/library/widgets/scripture_view.dart';
import 'package:app_chua/ui/widgets/audio_elements.dart';
import 'package:app_chua/ui/widgets/video_elements.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class TabViewContent extends StatelessWidget {
  final double appHeight;
  final bool isDetail;
  TabViewContent({required this.appHeight, this.isDetail = false});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                  indicatorColor: AppColors.orange,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: AppColors.black,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Kinh",
                    ),
                    Tab(text: "Sách"),
                    Tab(text: "Văn Thơ"),
                    Tab(text: "Những điều PT cần biết"),
                  ]),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    ScripturesView(widgetHeight: appHeight * 0.3),
                    BookView(),
                    PoemView(),
                    Text('Những điều PT cần biết'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
