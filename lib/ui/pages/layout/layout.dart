import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/home/home_page.dart';
import 'package:app_chua/ui/pages/layout/tab_manager.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  final Widget? child;
  AppLayout({this.child});
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  var tabs = [];
  @override
  void initState() {
    tabs = [
      TabModel(tabContent: widget.child ?? HomePage(), icon: Icon(Icons.home)),
      TabModel(tabContent: FavouritePage(), icon: Icon(Icons.bookmark)),
      TabModel(tabContent: ProfilePage(), icon: Icon(Icons.person))
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: tabs
                .map((e) => BottomNavigationBarItem(
                      icon: e.icon,
                    ))
                .toList(),
          ),
          tabBuilder: (context, index) {
            return ProviderWidget<Pop>(
              model: Pop(),
              onModelReady: (pop) {
                pop.setOnBack(() {
                  Navigator.of(context).pop();
                });
              },
              builder: (context, model, child) => CupertinoTabView(
                builder: (context) => tabs[index].tabContent,
              ),
            );
          },
        ),
      ),
    );
  }
}
