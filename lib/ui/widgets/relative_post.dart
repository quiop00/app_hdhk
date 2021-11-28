import 'package:app_chua/ui/pages/dialogue/audio_detail_page.dart';
import 'package:app_chua/ui/pages/event/event_detail_page.dart';
import 'package:app_chua/ui/pages/exbihition/exhibition_detail_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelativePostItem extends StatefulWidget {
  final related;
  final type;
  final model;
  const RelativePostItem({Key? key, this.related, this.type, this.model})
      : super(key: key);

  @override
  _RelativePostItemState createState() => _RelativePostItemState();
}

class _RelativePostItemState extends State<RelativePostItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.type == 'event') {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => EventDetailPage(
                      event: widget.related, model: widget.model)));
        }
        if (widget.type == 'exhibition') {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ExhibitionDetailPage(
                      exhibition: widget.related, model: widget.model)));
        }
      },
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.related.image))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text(widget.related.title))
          ],
        ),
      ),
    );
  }
}
