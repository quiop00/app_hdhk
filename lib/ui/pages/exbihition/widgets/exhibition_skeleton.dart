import 'package:app_chua/ui/pages/exbihition/widgets/photo_item.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExhibitionSkeleton extends StatefulWidget {
  const ExhibitionSkeleton({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ExhibitionSkeleton> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    bool isDark = theme.brightness == Brightness.dark;
    return Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: isDark ? (Colors.grey[700])! : (Colors.grey[350])!,
        highlightColor: isDark ? (Colors.grey[500])! : (Colors.grey[200])!,
        child: Container(
          height: appHeight - 50,
          child: Column(
            children: [
              Container(
                height: appHeight * 0.25,
                width: appWidth,
                color: AppColors.red,
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
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                            height: 120,
                            width: appWidth * 0.9,
                            color: AppColors.red,
                          )),
                ),
              )
            ],
          ),
        ));
  }
}
