import 'package:app_chua/model/event/event.dart';
import 'package:app_chua/ui/pages/event/event_detail_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/event_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EventViewModel>(context);
    return ListView.builder(
        itemCount: model.eventRes.data.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => EventDetailPage(
                            model: model, event: model.eventRes.data[index])));
              },
              child: EventItem(
                event: model.eventRes.data[index],
              ),
            ));
  }
}

class EventItem extends StatelessWidget {
  final Event event;
  EventItem({required this.event});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(event.image))),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(left: 15, right: 5),
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              event.date,
                              style: TextStyle(color: AppColors.yellow),
                            ),
                            Expanded(child: Text('Mô tả sự kiện'))
                          ],
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: RotationTransition(
                              turns: event.isSetNotify == true
                                  ? AlwaysStoppedAnimation(345 / 360)
                                  : AlwaysStoppedAnimation(0),
                              child: Icon(
                                event.isSetNotify == true
                                    ? Icons.notifications
                                    : Icons.notifications_none_sharp,
                                size: 25,
                                color: AppColors.orange,
                              ),
                            ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
