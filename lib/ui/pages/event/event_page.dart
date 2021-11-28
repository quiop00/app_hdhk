import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/network/api.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/event/widgets/event_skeleton.dart';
import 'package:app_chua/ui/pages/event/widgets/event_slider.dart';
import 'package:app_chua/ui/pages/event/widgets/filter_event.dart';
import 'package:app_chua/ui/pages/event/widgets/slider_skeleton.dart';
import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/layout/tab_manager.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:app_chua/ui/widgets/event_list.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/event_view_model.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  var selected;
  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ProviderWidget<EventViewModel>(
      model: EventViewModel(),
      onModelReady: (model) async {
        await model.fetchEvents();
      },
      builder: (context, model, _) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () {
              context.read<Pop>().onBack();
            },
          ),
          middle: Text(
            'SỰ KIỆN',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) => FilterEvent(
                              model: model,
                            )));
              },
              child: Icon(Icons.wrap_text)),
        ),
        child: Container(
          height: appHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              model.isLoadingSlider
                  ? SliderSkeleton()
                  : EventSlider(onChange: (index) {
                      setState(() {
                        selected = index;
                      });
                    }),
              Expanded(
                child: model.isLoading
                    ? EventSkeleton()
                    : Container(
                        height: appHeight * 0.7,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Events(),
                      ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
