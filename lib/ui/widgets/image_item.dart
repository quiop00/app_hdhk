import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget {
  final onSelectImage;
  final String url;
  final bool isSelected;
  ImageItem(
      {required this.url,
      required this.onSelectImage,
      required this.isSelected});
  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onSelectImage,
      child: Container(
        width: 150,
        child: Stack(
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.only(left: 20, right: 5),
              decoration: BoxDecoration(
                  // color: widget.isSelected == true
                  //     ? AppColors.black.withOpacity(0.6)
                  //     : AppColors.white,
                  border: widget.isSelected == true
                      ? Border.all(color: AppColors.white, width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      colorFilter: widget.isSelected == false
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop)
                          : null,
                      image: NetworkImage(widget.url),
                      fit: BoxFit.cover)),
            ),
            // Positioned(
            //     top: 0,
            //     child: Visibility(
            //       visible: !widget.isSelected,
            //       child: Container(
            //         margin: EdgeInsets.only(left: 20, right: 5),
            //         width: 150,
            //         height: 120,
            //         decoration: BoxDecoration(
            //           color: AppColors.black.withOpacity(0.6),
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //       ),
            //     ))
          ],
        ),
      ),
    );
  }
}
