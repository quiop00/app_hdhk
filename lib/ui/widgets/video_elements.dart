import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/ui/pages/dialogue/video_detail_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoElements extends StatefulWidget {
  final double height;
  VideoElements({required this.height});
  @override
  State<StatefulWidget> createState() {
    return _VideoElements();
  }
}

class _VideoElements extends State<VideoElements> {
  createVideo() {
    return ResourceModel.fromJson({
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => VideoDetailPage(
                            video: createVideo(),
                          )));
                },
                child: VideoElement(
                  index: index,
                ),
              )),
    );
  }
}

class VideoElement extends StatefulWidget {
  final index;
  VideoElement({this.index});
  @override
  State<StatefulWidget> createState() {
    return _VideoElement();
  }
}

class _VideoElement extends State<VideoElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 6),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColors.orange.withOpacity(widget.index == 0 ? 0.4 : 0),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/background/account_page.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tựa đề video',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text('21/01/2020')
                        ],
                      ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.bookmark_border_sharp),
                        Text('30:00')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
