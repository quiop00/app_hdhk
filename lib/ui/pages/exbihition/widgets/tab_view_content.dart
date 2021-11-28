import 'package:app_chua/ui/pages/exbihition/widgets/calligraphy_exhibition.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/photo_exhibition.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/picture_exhibition.dart';
import 'package:app_chua/ui/widgets/audio_elements.dart';
import 'package:app_chua/ui/widgets/video_elements.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:flutter/material.dart';

class TabViewContent extends StatefulWidget {
  final ExhibitionViewModel model;
  final double appHeight;
  final bool isDetail;
  TabViewContent(
      {required this.model, required this.appHeight, this.isDetail = false});

  @override
  _TabViewContentState createState() => _TabViewContentState();
}

class _TabViewContentState extends State<TabViewContent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.expand(height: 50),
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TabBar(
                  indicatorColor: AppColors.orange,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: AppColors.black,
                  isScrollable: true,
                  tabs: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Tab(
                        text: "Ảnh",
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Tab(text: "Tranh")),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Tab(text: "Thư pháp")),
                  ]),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    PhotoExhibition(
                      model: widget.model,
                    ),
                    PictureExhibition(),
                    CalligraphyExhibition()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
