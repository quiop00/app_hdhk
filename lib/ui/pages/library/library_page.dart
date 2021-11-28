import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/history/history_home.dart';
import 'package:app_chua/ui/pages/layout/tab_manager.dart';
import 'package:app_chua/ui/pages/library/widgets/tab_view.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => context.read<Pop>().onBack(),
          ),
          middle: Text(
            'THƯ VIỆN',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.search),
        ),
        child: Container(
          height: appHeight - 30,
          color: AppColors.white,
          child: TabViewContent(
            appHeight: appHeight,
          ),
        ),
      ),
    );
  }
}
