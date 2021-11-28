import 'package:app_chua/model/audio/audio_model.dart';
import 'package:app_chua/model/resource/playlist.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/description_widget.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/playlist_widget.dart';
import 'package:app_chua/ui/widgets/playlist_elements.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayCollectionPage extends StatefulWidget {
  final String title;
  final PlayList? playList;
  PlayCollectionPage({this.playList, this.title = 'PHÁP THOẠI'});
  @override
  _PlayCollectionPageState createState() => _PlayCollectionPageState();
}

class _PlayCollectionPageState extends State<PlayCollectionPage> {
  AudioModel createAudio() {
    return AudioModel.fromJson({
      'id': 1,
      'title': 'Tiêu đề audio',
      'description': 'Mô tả',
      'replace': 'Thầy giảng tại chùa Bửu Long',
      'url': ''
    });
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Text('Audio'),
      ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: appHeight * 0.25,
                width: appWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/background/account_page.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tuyển tập số 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColors.orange),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Thầy giảng tại chùa Huyền Không Sơn Thượng',
                        style: TextStyle(color: AppColors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Text(
                            'Playlist',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Row(
                            children: [
                              Icon(Icons.bookmark_border_sharp),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.share,
                                color: AppColors.blue,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 20,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Divider(
                                    color: AppColors.orange, thickness: 5)),
                            Expanded(
                                flex: 10,
                                child: Divider(
                                    color: AppColors.grey, thickness: 1))
                          ],
                        ),
                      ),
                      PlaylistWidget(
                        listHeight: appHeight * 0.5 - 50,
                        playList: widget.playList!,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
