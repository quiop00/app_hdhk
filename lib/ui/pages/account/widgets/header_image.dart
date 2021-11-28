import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final height;
  HeaderImage({this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          image: DecorationImage(
              image: AssetImage('assets/background/account_page.png'),
              fit: BoxFit.cover)),
    );
  }
}
