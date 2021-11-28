import 'package:app_chua/model/monk/monk.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/filter_dialogue.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/tab_view.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogueByMonk extends StatefulWidget {
  final Monk monk;
  DialogueByMonk({required this.monk});
  @override
  _DialogueByMonkState createState() => _DialogueByMonkState();
}

class _DialogueByMonkState extends State<DialogueByMonk> {
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
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            'NGÀI ${widget.monk.name!.toUpperCase() ?? ''}',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: widget.monk.filters == null
              ? null
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (_, __, ___) => FilterDialogue(
                              monk: widget.monk,
                            )));
                  },
                  child: Icon(Icons.wrap_text)),
        ),
        child: Container(
          height: appHeight - 80,
          color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: TabViewContent(
                  appHeight: appHeight,
                  isDetail: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
