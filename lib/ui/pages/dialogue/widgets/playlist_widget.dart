import 'package:app_chua/model/resource/playlist.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/ui/pages/dialogue/audio_detail_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaylistWidget extends StatefulWidget {
  final listHeight;
  final PlayList? playList;
  PlaylistWidget({@required this.listHeight, this.playList});
  @override
  State<StatefulWidget> createState() {
    return _PlaylistWidget();
  }
}

class _PlaylistWidget extends State<PlaylistWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.listHeight,
      child: ListView.builder(
          itemCount: widget.playList!.items.length,
          itemBuilder: (context, index) => PlayListItem(
                resource: widget.playList!.items[index],
              )),
    );
  }
}

class PlayListItem extends StatelessWidget {
  final ResourceModel resource;
  PlayListItem({required this.resource});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.grey, width: 0.6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.play_arrow_outlined,
            size: 30,
            color: AppColors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resource.author ?? "No Author",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  resource.title ?? "Không có tiêu đề",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(resource.description ?? "Không có mô tả"),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    AudioDetailPage(audio: resource)));
                      },
                      child: Text(
                        'Details',
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('1:14:32')
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
