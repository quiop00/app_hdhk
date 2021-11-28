import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SliderSkeleton extends StatefulWidget {
  const SliderSkeleton({Key? key}) : super(key: key);

  @override
  _SliderSkeletonState createState() => _SliderSkeletonState();
}

class _SliderSkeletonState extends State<SliderSkeleton> {
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
          width: appWidth,
          height: MediaQuery.of(context).size.height * 0.25,
          color: AppColors.red,
        ));
  }
}
