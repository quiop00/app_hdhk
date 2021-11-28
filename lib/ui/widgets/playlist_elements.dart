import 'package:app_chua/model/resource/playlist.dart';
import 'package:app_chua/ui/pages/dialogue/play_collection_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayListElements extends StatefulWidget {
  final double height;
  PlayListElements({required this.height});
  @override
  State<StatefulWidget> createState() {
    return _PlayListElements();
  }
}

class _PlayListElements extends State<PlayListElements> {
  late List<PlayList> playLists;
  @override
  void initState() {
    playLists = PlayList.getPlayLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ListView.builder(
          itemCount: playLists.length,
          itemBuilder: (context, index) => PlayListElement(
                playList: playLists[index],
              )),
    );
  }
}

class PlayListElement extends StatefulWidget {
  final PlayList playList;
  PlayListElement({required this.playList});
  @override
  State<StatefulWidget> createState() {
    return _PlayListElement();
  }
}

class _PlayListElement extends State<PlayListElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 6),
      height: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => PlayCollectionPage(
                                        playList: widget.playList,
                                      )));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/background/account_page.png'),
                                  fit: BoxFit.cover)),
                        ),
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
                            widget.playList.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(widget.playList.date)
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
                        Icon(
                          widget.playList.bookmark == true
                              ? Icons.bookmark
                              : Icons.bookmark_border_sharp,
                          color: AppColors.orange,
                        ),
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
