import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactInfo extends StatefulWidget {
  final String info;
  const ContactInfo({required this.info, Key? key}) : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Container(
              width: width,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: AppColors.semiGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Địa chỉ: '),
                  Text('Website: '),
                  Text('Skype: '),
                  Text('Email: ')
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.youtube,
                        color: AppColors.red, size: 50.0),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(FontAwesomeIcons.facebook,
                        color: AppColors.blue, size: 40.0)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
