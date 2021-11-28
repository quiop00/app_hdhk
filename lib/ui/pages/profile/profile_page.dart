import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool select = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: AppColors.white,
        child: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: appHeight * 0.32,
              backgroundColor: AppColors.orange,
              leading: Icon(Icons.arrow_back_ios),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/background/account_page.png'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Jumi',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 25),
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          select = !select;
                          select
                              ? _animationController.forward()
                              : _animationController.reverse();
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 10, left: 0, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: AppColors.grey))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_border_sharp,
                              color: AppColors.orange,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Trang lưu',
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedIcon(
                                    icon: AnimatedIcons.menu_arrow,
                                    progress: _animationController),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    select ? _bookMark() : _buildSelection()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelection() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MyRouter.getRoute(RouteName.notification));
          },
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 0, bottom: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.grey))),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_none_sharp,
                  color: AppColors.orange,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Thông Báo',
                    style: TextStyle(
                        color: AppColors.black, fontWeight: FontWeight.bold)),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: AppColors.grey.withOpacity(0.6),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 0, bottom: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey))),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.orange,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Tài Khoản',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.grey.withOpacity(0.6),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, left: 0, bottom: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey))),
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: AppColors.orange,
              ),
              SizedBox(
                width: 10,
              ),
              Text('Thoát Tài Khoản',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.grey.withOpacity(0.6),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _bookMark() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 14, left: 0, bottom: 14),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Triễn Lãm',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 14, left: 0, bottom: 14),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Thư Viện',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 14, left: 0, bottom: 14),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Pháp Thoại',
                  style: TextStyle(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
