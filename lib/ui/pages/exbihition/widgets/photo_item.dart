import 'package:app_chua/ui/pages/exbihition/exhibition_detail_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoItem extends StatelessWidget {
  final item;
  PhotoItem({required this.item});
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExhibitionViewModel>(context);
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) =>
                      ExhibitionDetailPage(exhibition: item, model: model)));
        },
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
                        fit: BoxFit.cover, image: NetworkImage(item.image))),
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
                              Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                item.getDate(),
                                style: TextStyle(color: AppColors.yellow),
                              ),
                              Expanded(child: Text('Mô tả tranh/ ảnh'))
                            ],
                          ),
                          Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(
                                item.isBookmark == true
                                    ? Icons.bookmark_outlined
                                    : Icons.bookmark_border_sharp,
                                size: 25,
                                color: AppColors.orange,
                              ))
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
