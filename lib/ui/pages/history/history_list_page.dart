import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/account/widgets/header_image.dart';
import 'package:app_chua/ui/pages/history/history_monk_detail.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/list_monk_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListHistoryPage();
  }
}

class _ListHistoryPage extends State<ListHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final headerHeight = MediaQuery.of(context).size.height * 0.5;
    final itemHeight = 100.0;
    //test UI
    final arr = [1, 2, 3, 4];
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Text(
            'CHƯ VỊ THÀNH LẬP',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: SingleChildScrollView(
            child: Container(
          height: appHeight,
          child: Stack(
            children: [
              HeaderImage(
                height: headerHeight,
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.7,
                  maxChildSize: 0.82,
                  builder: (context, controller) => ProviderWidget<
                          ListMonkViewModel>(
                      model: ListMonkViewModel(),
                      builder: (context, model, child) {
                        return Container(
                          height: appHeight - headerHeight + 120,
                          width: appWidth,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: ListView.builder(
                              padding: EdgeInsets.all(1.0),
                              controller: controller,
                              itemCount: 4,
                              itemBuilder: (context, index) => Container(
                                    height: itemHeight,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        MonkDetailPage()));
                                          },
                                          child: Container(
                                            height: itemHeight - 10,
                                            width: itemHeight - 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/background/account_page.png'),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ngài Viên Minh',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text('Sư tổ chùa Huyền Không',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColors.red)),
                                                Flexible(
                                                  child: Text(
                                                      'Trú xứ hiện tại: Chùa Huyền Không Sơn Thượng',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: AppColors
                                                              .lightGreen)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                        );
                      }))
            ],
          ),
        )),
      ),
    );
  }
}
