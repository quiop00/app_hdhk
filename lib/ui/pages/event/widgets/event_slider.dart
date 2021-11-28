import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/event_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventSlider extends StatelessWidget {
  final onChange;
  EventSlider({@required this.onChange});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EventViewModel>(context);
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                  items: model.pagodas
                      .map((e) => Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(e.image))),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) async {
                      await model.loadEventByPagoda(index: index);
                    },
                    initialPage: model.currentIndex,
                    reverse: true,
                    viewportFraction: 1,
                  )),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.orange.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.play_arrow_sharp,
                              color: AppColors.white,
                              size: 14,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.pagodas[model.currentIndex].name,
                          style: TextStyle(color: AppColors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.play_arrow_sharp,
                          color: AppColors.white,
                          size: 14,
                        )
                      ],
                    )))
          ],
        ));
  }
}
