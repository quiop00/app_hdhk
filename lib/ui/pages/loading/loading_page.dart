import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/home/home_page.dart';
import 'package:app_chua/ui/pages/loading/widgets/audio_loading.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/content_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ProviderWidget<ContentViewModel>(
        model: ContentViewModel(),
        onModelReady: (model) async {
          await model.fetchContent();
        },
        builder: (context, model, _) => Container(
          height: height,
          width: width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.4,
                child: Center(
                  child: Container(
                    height: width * 0.4,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/background/icon_hdhk.png'))),
                  ),
                ),
              ),
              Container(
                height: height * 0.45,
                child: CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: height * 0.45,
                      onPageChanged: (index, reason) {
                        model.onChange(index);
                      }),
                  items: model.contents
                      .map((e) => Container(
                            height: height * 0.45,
                            width: width,
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    e.content,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: width,
                    height: 30,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Visibility(
                      visible: model.author == null ? false : true,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColors.orange,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: Text(
                          model.author ?? '',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: width * 0.45,
                      bottom: 10,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                height: 5,
                                width: 5,
                                color: model.index! % 3 == 0
                                    ? AppColors.orange
                                    : AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ClipOval(
                              child: Container(
                                height: 5,
                                width: 5,
                                color: model.index! % 3 == 1
                                    ? AppColors.orange
                                    : AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            ClipOval(
                              child: Container(
                                height: 5,
                                width: 5,
                                color: model.index! % 3 == 2
                                    ? AppColors.orange
                                    : AppColors.grey,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
              Expanded(
                  child: model.isBusy == true
                      ? Container()
                      : AudioLoading(
                          onCompleted: () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          urlAudio: model.pathAudio,
                          width: width * 0.8,
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
