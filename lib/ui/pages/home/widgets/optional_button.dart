import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class OptionalButton extends StatefulWidget {
  final String title;
  final Function() onTap;
  OptionalButton({required this.title, required this.onTap});
  @override
  _OptionalButtonState createState() => _OptionalButtonState();
}

class _OptionalButtonState extends State<OptionalButton> {
  late bool isHover;
  @override
  void initState() {
    isHover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover) {
        setState(() {
          isHover = hover;
        });
      },
      onTap: widget.onTap,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            color: isHover ? AppColors.orange : AppColors.black.withOpacity(0),
            border:
                Border(bottom: BorderSide(width: 3, color: AppColors.orange))),
        child: Text(widget.title,
            style: TextStyle(color: AppColors.white, fontSize: 20)),
      ),
    );
  }
}
