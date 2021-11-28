import 'package:app_chua/ui/widgets/audio_elements.dart';
import 'package:app_chua/ui/widgets/playlist_elements.dart';
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
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TabBar(
                  indicatorColor: AppColors.orange,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: AppColors.black,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Audio",
                    ),
                    Tab(text: "Video"),
                    Tab(text: "Tuyển tập"),
                    Tab(text: "Hỏi đáp Phật Pháp"),
                  ]),
            ),
            Divider(),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    AudioElements(
                      height: appHeight * 0.8,
                      hasPlayerButton: !isDetail,
                    ),
                    VideoElements(
                      height: appHeight * 0.8,
                    ),
                    PlayListElements(height: appHeight * 0.8),
                    Text('Hỏi đáp Phật Pháp'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
