import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';

class ListImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => SmallImageItem()),
    );
  }
}

class SmallImageItem extends StatefulWidget {
  @override
  _SmallImageItemState createState() => _SmallImageItemState();
}

class _SmallImageItemState extends State<SmallImageItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //focus image
      },
      child: Container(
        width: 140,
        margin: EdgeInsets.only(left: 20, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('assets/background/account_page.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
