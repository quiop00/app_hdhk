import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hint;
  final Function(String value) onChange;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscureText;
  InputField(
      {required this.hint,
      required this.controller,
      required this.onChange,
      required this.validator,
      this.type = TextInputType.text,
      this.obscureText = false});

  @override
  State<StatefulWidget> createState() {
    return _InputField();
  }
}

class _InputField extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChange,
        validator: widget.validator,
        keyboardType: widget.type,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.teal, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.red, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          labelText: widget.hint,
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
