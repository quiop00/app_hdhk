import 'package:app_chua/model/event/event.dart';
import 'package:app_chua/model/exhibition/exhibition.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/event/image_in_event.dart';
import 'package:app_chua/ui/widgets/relative_post.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/event_view_model.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExhibitionDetailPage extends StatefulWidget {
  final Exhibition exhibition;
  final ExhibitionViewModel model;
  ExhibitionDetailPage({required this.exhibition, required this.model});
  @override
  _ExhibitionDetailPageState createState() => _ExhibitionDetailPageState();
}

class _ExhibitionDetailPageState extends State<ExhibitionDetailPage> {
  List<String> images = [];
  @override
  void initState() {
    // TODO: implement initState
    RegExp exp = new RegExp(r"(http(s?):)(.*?)\.(?:jpg|gif|png|JPG)");
    Iterable<Match> matches = exp.allMatches(widget.exhibition.content);
    matches.toList().forEach((item) {
      images.add(item[0]!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            'TRIỂN LÃM',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.search),
        ),
        child: Container(
          height: appHeight - 30,
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: appHeight * 0.3,
                  child: Stack(
                    children: [
                      Container(
                          height: appHeight * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(widget.exhibition.image),
                                  fit: BoxFit.cover))),
                      Positioned(
                          bottom: 0,
                          right: 15,
                          child: Icon(
                            widget.exhibition.isBookmark == true
                                ? Icons.bookmark_outlined
                                : Icons.bookmark_border_sharp,
                            size: 25,
                            color: AppColors.orange,
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: AppColors.orange,
                        child: Text(
                          widget.exhibition.type,
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.exhibition.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Text('Người viết'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(Icons.schedule),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(widget.exhibition.getDate())
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.share,
                                      color: AppColors.orange,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider()),
                      Html(customRender: {
                        'img': (context, child) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(this.context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (_, __, ___) => ImageInEvent(
                                      images: images,
                                      selectImage:
                                          context.tree.attributes['src'])));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          context.tree.attributes['src'] ?? ''),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Icon(Icons.expand)),
                                  Positioned(
                                      bottom: 10,
                                      child: Container(
                                        height: 30,
                                        width: appWidth,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: AppColors.black
                                                .withOpacity(0.5)),
                                        child: Text(
                                          context.tree.attributes['alt'] ??
                                              'Đây là mô tả của bức hình này',
                                          style:
                                              TextStyle(color: AppColors.white),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }
                      }, data: widget.exhibition.content),
                      DefaultTabController(
                        length: 1,
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints.expand(height: 35),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: TabBar(
                                  indicatorColor: AppColors.orange,
                                  indicatorWeight: 5,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: AppColors.black,
                                  isScrollable: true,
                                  tabs: [
                                    Tab(
                                        child: Text("Bài liên quan",
                                            style: TextStyle(
                                                color: AppColors.orange))),
                                  ]),
                            ),
                            ConstrainedBox(
                                constraints: new BoxConstraints(
                                  minHeight: 200.0,
                                  maxHeight: 300.0,
                                ),
                                child: ProviderWidget<ExhibitionViewModel>(
                                  model: ExhibitionViewModel(),
                                  onModelReady: (model) async {
                                    await model.getRelatedExhibition(
                                        exhibitionId: widget.exhibition.id);
                                  },
                                  builder: (context, model, _) => model
                                          .isLoading
                                      ? Container()
                                      : ListView.builder(
                                          itemCount:
                                              model.relatedExhibition.length,
                                          itemBuilder: (context, index) =>
                                              RelativePostItem(
                                            model: model,
                                            related:
                                                model.relatedExhibition[index],
                                            type: 'exhibition',
                                          ),
                                        ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
