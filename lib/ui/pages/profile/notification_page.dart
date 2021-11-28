import 'package:app_chua/ui/pages/profile/widgets/custom_app_bar.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: AppColors.white,
        child: Container(
          height: appHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 120,
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        child: AppBar(
                          centerTitle: true,
                          title: Text('title'),
                          backgroundColor: AppColors.orange,
                          leading: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back_ios)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30))),
                        ),
                      ),
                      Positioned(
                          top: 65,
                          right: 28,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.white,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(
                                  'assets/background/account_page.png'),
                            ),
                          ))
                    ],
                  ),
                ),
                Center(
                  child: Text('data'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
