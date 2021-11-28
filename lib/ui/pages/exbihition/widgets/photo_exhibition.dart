import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/exhibition_skeleton.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/photo_item.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoExhibition extends StatefulWidget {
  final ExhibitionViewModel model;
  PhotoExhibition({required this.model});
  @override
  _PhotoExhibitionState createState() => _PhotoExhibitionState();
}

class _PhotoExhibitionState extends State<PhotoExhibition>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return ProviderWidget<ExhibitionViewModel>(
        model: widget.model,
        onModelReady: (model) async {
          await model.fetchExhibition(type: 'exh_image');
        },
        builder: (context, model, _) => model.isLoading
            ? ExhibitionSkeleton()
            : Container(
                height: appHeight - 50,
                child: Column(
                  children: [
                    Container(
                      height: appHeight * 0.25,
                      child: CarouselSlider(
                          items: model.images
                              .map((e) => Container(
                                    margin: EdgeInsets.only(left: 1.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(e))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              reverse: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              onPageChanged: (index, reason) {
                                model.onChangeCarousel(index);
                              })),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: appWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              height: 5,
                              width: 5,
                              color: model.currentIndex! % 3 == 2
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
                              color: model.currentIndex! % 3 == 1
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
                              color: model.currentIndex! % 3 == 0
                                  ? AppColors.orange
                                  : AppColors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: appWidth,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.grey,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 4,
                              color: AppColors.orange,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Divider(
                              thickness: 1,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: appHeight * 0.7,
                      child: ListView.builder(
                          itemCount: model.exhibitionRes.data.length,
                          itemBuilder: (context, index) =>
                              PhotoItem(item: model.exhibitionRes.data[index])),
                    ))
                  ],
                ),
              ));
  }

  Widget _buildSlider(model) {
    return CarouselSlider(
        items: model.images
            .map((e) => Container(
                  margin: EdgeInsets.only(left: 1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: NetworkImage(e))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
            reverse: true,
            enlargeCenterPage: true,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              model.onChangeCarousel();
            }));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
