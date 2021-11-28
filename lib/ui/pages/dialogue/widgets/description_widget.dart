import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/audio/audio_model.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/model/video/video_model.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DescriptionWidget extends StatelessWidget {
  final ResourceModel resource;
  final double height;
  DescriptionWidget({required this.height, required this.resource});
  @override
  Widget build(BuildContext context) {
    final type = (resource.type == ResourceType.AUDIO) ? 'Audio' : 'Video';
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, right: 20, top: 25, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              resource.title ?? "",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(resource.place ?? "",
                style: TextStyle(
                    fontSize: 15,
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 18,
            ),
            Container(
              height: height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Text(
                        'Mô tả $type',
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
                            color: AppColors.violet,
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
                            child:
                                Divider(color: AppColors.orange, thickness: 5)),
                        Expanded(
                            flex: 10,
                            child: Divider(color: AppColors.grey, thickness: 1))
                      ],
                    ),
                  ),
                  Text('20/5/2021'),
                  Expanded(
                    child: Html(data: """<span>
                              <p>
                              - Từ năm 1965 đến năm 1971 học Đại Học Vạn Hạnh, đồng thời nghiên cứu các Tông phái Phật giáo, tư tưởng các Tôn giáo và triết học Đông Tây.
                              </p>
                              </span>"""),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
