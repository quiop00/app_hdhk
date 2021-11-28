import 'package:app_chua/enums/monk_view_type.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/account/widgets/header_image.dart';
import 'package:app_chua/ui/pages/history/widgets/introduction.dart';
import 'package:app_chua/ui/pages/history/widgets/monk_header.dart';
import 'package:app_chua/ui/pages/history/widgets/small_image_item.dart';
import 'package:app_chua/ui/widgets/audio_widget.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/list_monk_view_model.dart';
import 'package:app_chua/view_model/monk_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class MonkDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MonkDetail();
  }
}

class _MonkDetail extends State<MonkDetailPage> {
  var contentHeight;
  var top;
  late bool expanded;
  late int select;
  @override
  void initState() {
    expanded = false;
    select = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final headerHeight = MediaQuery.of(context).size.height * 0.5;
    contentHeight = appHeight * 0.7 - 30;
    top = appHeight * 0.25;
    final imageHeight = appHeight * 0.25;
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Text(
            'CHƯ VỊ THÀNH LẬP PGNTVN',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: Container(
          height: appHeight,
          child: Stack(
            children: [
              HeaderImage(
                height: headerHeight,
              ),
              Positioned(
                  top: expanded ? appHeight * 0.1 : appHeight * 0.25,
                  child: ProviderWidget<MonkViewModel>(
                      model: MonkViewModel(),
                      builder: (context, model, child) {
                        return SingleChildScrollView(
                          child: Container(
                            height: expanded
                                ? (appHeight * 0.85 - 40)
                                : (appHeight * 0.7 - 40),
                            width: appWidth,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: model.isBusy
                                ? Shimmer.fromColors(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    baseColor: (Colors.grey[500])!,
                                    highlightColor: (Colors.grey[200])!)
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: model.viewType ==
                                                  MonkViewType.information
                                              ? _buildContent(
                                                  context, model, appWidth)
                                              : _buildAlbum(appWidth)),
                                      Container(
                                        height: appHeight * 0.3,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(bottom: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: imageHeight,
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                        'Ảnh về ngài Viên Minh',
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .orange,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    height: 120,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: 4,
                                                        itemBuilder: (context,
                                                                index) =>
                                                            GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    expanded =
                                                                        true;
                                                                  });

                                                                  model.changeType(
                                                                      MonkViewType
                                                                          .album);
                                                                },
                                                                child:
                                                                    SmallImageItem())),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(context, model, appWidth) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MonkDetailHeader(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Introduction',
                      style: TextStyle(fontSize: 18, color: AppColors.black),
                    )),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: Introduction(
                  model: model,
                  scrollable: expanded,
                )),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            expanded ? 'RÚT GỌN' : 'ĐỌC THÊM',
                            style: TextStyle(color: AppColors.blue),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
              child: AudioWidget(
            urlAudio:
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            sliderWidth: appWidth - 90,
          ))
        ],
      ),
    );
  }

  Widget _buildAlbum(appWidth) {
    return Container(
        width: appWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text('Tiêu đề bộ ảnh',
                  style: TextStyle(fontSize: 20, color: AppColors.orange)),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: CarouselSlider(
                    items: [1, 2]
                        .map((e) => Container(
                              margin: EdgeInsets.only(left: 1.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: ClipRRect(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/background/account_page.png'))),
                                      ),
                                    ),
                                  ),
                                  Text('Caption')
                                ],
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          select = index;
                        });
                      },
                      reverse: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.83,
                    )))
          ],
        ));
  }
}
