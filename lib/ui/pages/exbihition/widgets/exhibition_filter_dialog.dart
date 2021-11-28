import 'package:app_chua/model/author/author.dart';
import 'package:app_chua/model/filter.dart';
import 'package:app_chua/model/monk/monk.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/event_view_model.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_result.dart';

class FilterExhibition extends StatefulWidget {
  final ExhibitionViewModel model;
  FilterExhibition({required this.model});
  @override
  _FilterExhibitionState createState() => _FilterExhibitionState();
}

class _FilterExhibitionState extends State<FilterExhibition> {
  Author? search;
  @override
  void initState() {
    if (widget.model.selectedAuthor != null) {
      search = widget.model.filters
          .firstWhere((element) => element.id == widget.model.selectedAuthor);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: CupertinoPageScaffold(
        backgroundColor: AppColors.white.withOpacity(0.4),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            "TRIỂN LÃM",
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.wrap_text),
        ),
        child: Container(
          height: appHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(maxHeight: appHeight * 0.5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  color: AppColors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: AppColors.grey)
                            ]),
                        child: Text(
                          'Qúy vị vui lòng chọn Tác giả',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                          child: Container(
                        color: AppColors.white,
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: widget.model.filters
                                  .map((e) => ListTile(
                                        leading: Radio<Author>(
                                          value: e,
                                          onChanged: (value) {
                                            setState(() {
                                              search = value!;
                                            });
                                          },
                                          groupValue: search,
                                        ),
                                        title: Text(
                                          e.name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.red2),
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (search == null) {
                        Navigator.pop(context);
                      } else {
                        await widget.model
                            .loadExhibitionByAuthor(authorId: search!.id);
                        if (widget.model.onFilterPage) {
                          widget.model.setOnFilterPage(false);
                          Navigator.pop(context, [search!.id]);
                        } else
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FilterResult(
                                        model: widget.model,
                                      )));
                      }
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.white2)),
                    child: Text(
                      'HIỂN THỊ',
                      style: TextStyle(color: AppColors.orange),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
