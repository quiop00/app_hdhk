import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/model/menu_options.dart';
import 'package:app_chua/ui/pages/history/history_home.dart';
import 'package:app_chua/ui/pages/home/widgets/optional_button.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuOption> options = MenuOption.getOptions();
  late bool visible;
  @override
  void initState() {
    visible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final TextStyle textHeaderStyle = TextStyle(
        fontSize: 25, color: AppColors.orange, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background/account_page.png'),
                      fit: BoxFit.cover))),
          Positioned(
              top: 0,
              child: Container(
                  height: height * 0.3,
                  width: width,
                  child: Center(
                    child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/background/icon_hdhk.png'),
                                fit: BoxFit.cover))),
                  ))),
          Positioned(
            bottom: height * 0.05,
            left: 0,
            child: Container(
              height: height * 0.22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: AppColors.orange),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: InkWell(
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: visible
                              ? AppColors.black.withOpacity(0.89)
                              : AppColors.black.withOpacity(0)),
                      child: Icon(
                        Icons.sort,
                        color: AppColors.white,
                      ),
                    ),
                  ))
                  ,
                  InkWell(
                    onTap: () {
                      setState(() {
                        visible = false;
                      });
                      Navigator.of(context)
                          .push(MyRouter.getRoute(RouteName.profile));
                    },
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.person, color: AppColors.white)),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          visible = false;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.all(15),
                          child: Icon(Icons.search, color: AppColors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: height * 0.12,
              left: width * 0.15,
              child: Visibility(
                visible: visible,
                child: _buildMenu(height * 0.65, width * 0.7),
              ))
        ],
      ),
    );
  }

  Widget _buildMenu(height, width) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.black.withOpacity(0.89)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: height - 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) => OptionalButton(
                    title: options[index].name,
                    onTap: () {
                      Navigator.of(context)
                          .push(MyRouter.getRoute(options[index].routePath));
                    })),
          ),
          InkWell(
            onTap: () {
              setState(() {
                visible = false;
              });
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Thoát',
                    style: TextStyle(color: AppColors.orange, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
