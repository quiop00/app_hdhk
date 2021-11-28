import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GridSkeleton extends StatelessWidget {
  final length;
  final crossAxisCount;
  final heightGridItem;
  GridSkeleton(
      {required this.length,
      required this.crossAxisCount,
      required this.heightGridItem});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: (Colors.grey[400])!,
        highlightColor: (Colors.grey[200])!,
        period: Duration(milliseconds: 1000),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 15 / 10,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20),
            itemBuilder: (context, index) => Container(
                  height: 100.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 100, height: 20, color: AppColors.red),
                      SizedBox(height: 5),
                      Expanded(
                        child: Container(color: AppColors.red),
                      ),
                    ],
                  ),
                )));
  }
}

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  SkeletonBox(
      {required this.width, required this.height, this.isCircle: false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Divider.createBorderSide(context, width: 0.7);
    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(isCircle: isCircle, isDark: isDark),
    );
  }
}

class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle: false,
    isDark: false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}

class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration()
      : super(border: Border(bottom: BorderSide(width: 0.3)));
}

class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final Widget item;

  SkeletonList(
      {this.length: 6,
      this.padding = const EdgeInsets.all(7),
      required this.item});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      period: Duration(milliseconds: 1200),
      baseColor: isDark ? (Colors.grey[700])! : (Colors.grey[350])!,
      highlightColor: isDark ? (Colors.grey[500])! : (Colors.grey[200])!,
      child: ListView.builder(
          itemCount: this.length, itemBuilder: (context, index) => item),
    );
  }
}
