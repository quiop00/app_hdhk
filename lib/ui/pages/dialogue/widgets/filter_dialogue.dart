import 'package:app_chua/model/monk/monk.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterDialogue extends StatefulWidget {
  final Monk? monk;
  FilterDialogue({this.monk});
  @override
  _FilterDialogueState createState() => _FilterDialogueState(monk: monk);
}

class _FilterDialogueState extends State<FilterDialogue> {
  Monk? monk;
  _FilterDialogueState({this.monk});
  late String search;
  @override
  void initState() {
    search = monk!.filters!.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: CupertinoPageScaffold(
        backgroundColor: AppColors.white.withOpacity(0.5),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            widget.monk != null
                ? 'NGÀI ${widget.monk!.name!.toUpperCase()}'
                : "PHÁP THOẠI",
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
                          'Qúy vị vui lòng chọn nhóm nội dung cần tìm',
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
                              children: widget.monk!.filters!
                                  .map((e) => ListTile(
                                        leading: Radio<String>(
                                          value: e,
                                          onChanged: (value) {
                                            setState(() {
                                              search = value!;
                                            });
                                          },
                                          groupValue: search,
                                        ),
                                        title: Text(
                                          e,
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
                    onPressed: () {},
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
