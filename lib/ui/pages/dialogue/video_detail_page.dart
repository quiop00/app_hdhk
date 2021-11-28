import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/audio/audio_model.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/model/video/video_model.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/description_widget.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/video_player_widget.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:video_player/video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final String title;
  final ResourceModel video;
  VideoDetailPage({this.title = 'VIDEO', required this.video});
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            widget.title,
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.wrap_text),
        ),
        child: Container(
          height: appHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: appWidth,
                  color: AppColors.white,
                ),
                Container(
                  height: appHeight,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          child: Container(
                            height: appHeight,
                            width: appWidth,
                            color: AppColors.orange,
                          )),
                      Positioned(
                        top: 30,
                        child: Container(
                          height: appHeight,
                          width: appWidth,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                indent: appWidth * 0.41,
                                endIndent: appWidth * 0.41,
                                thickness: 4,
                                color: AppColors.grey.withOpacity(0.4),
                              ),
                              SizedBox(
                                height: 20 + 10.0,
                              ),
                              VideoPlayerWidget(video: widget.video),
                              Expanded(
                                child: DescriptionWidget(
                                    height: appHeight * 0.6,
                                    resource: widget.video),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
