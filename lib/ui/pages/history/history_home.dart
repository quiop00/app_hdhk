import 'package:app_chua/ui/pages/exbihition/exhibition_page.dart';
import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/history/history_list_page.dart';
import 'package:app_chua/ui/pages/history/widgets/history_item.dart';
import 'package:app_chua/ui/pages/layout/tab_manager.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryHome();
  }
}

class _HistoryHome extends State<HistoryHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 120;
    final width = MediaQuery.of(context).size.width;
    final itemHeight = (height - 40) / 2;
    return Scaffold(
        body: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: AppColors.white,
              leading: CupertinoNavigationBarBackButton(
                color: AppColors.orange,
                onPressed: () => context.read<Pop>().onBack(),
              ),
              middle: Text(
                'SỬ LIỆU',
                style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            child: Container(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HistoryItem(
                        // context: context,
                        itemHeight: itemHeight,
                        imagePath: 'assets/background/account_page.png',
                        bgColor: AppColors.lightRed,
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => ListHistoryPage()));
                        },
                        title: 'PHẬT GIÁO\nNGUYÊN THỦY VIỆT NAM',
                        smallText: 'Chư Vị Thành Lập'),
                    HistoryItem(
                      // context: context,
                      itemHeight: itemHeight,
                      imagePath: 'assets/background/account_page.png',
                      bgColor: AppColors.lightRed,
                      onTap: () {},
                      title: 'SỬ LIỆU\nHUYỀN KHÔNG',
                    )
                  ],
                ),
              ),
            )));
  }
}
