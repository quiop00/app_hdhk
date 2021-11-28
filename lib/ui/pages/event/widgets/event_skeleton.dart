import 'package:app_chua/ui/widgets/skeleton.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventSkeleton extends StatefulWidget {
  const EventSkeleton({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<EventSkeleton> {
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
          height: appHeight * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                    height: 150,
                    width: appWidth * 0.9,
                    color: AppColors.red,
                    margin: EdgeInsets.symmetric(vertical: 10),
                  ))),
    );
  }
}
