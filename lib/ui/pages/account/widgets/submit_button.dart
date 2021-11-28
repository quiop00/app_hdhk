import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Function()? submit;
  final String title;
  SubmitButton({required this.submit, required this.title});
  @override
  State<StatefulWidget> createState() {
    return _SubmitButton();
  }
}

class _SubmitButton extends State<SubmitButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.submit,
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: AppColors.white),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
