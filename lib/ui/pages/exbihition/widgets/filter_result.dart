import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/photo_item.dart';
import 'package:app_chua/ui/widgets/skeleton.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'exhibition_filter_dialog.dart';

class FilterResult extends StatefulWidget {
  final model;
  const FilterResult({Key? key, required this.model}) : super(key: key);

  @override
  _FilterResultState createState() => _FilterResultState();
}

class _FilterResultState extends State<FilterResult> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ProviderWidget<ExhibitionViewModel>(
      model: widget.model,
      onModelReady: (model) async {
        await model.loadExhibitionAuthor();
        model.setOnFilterPage(true);
      },
      builder: (context, model, _) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Text(
            'TRIỄN LÃM',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
              onTap: model.isLoadingAuthor
                  ? null
                  : () async {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (_, __, ___) => FilterExhibition(
                                    model: model,
                                  )));
                    },
              child: Icon(Icons.wrap_text)),
        ),
        child: Container(
          height: appHeight - 30,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: AppColors.orange,
                  child: Text(
                    widget.model.author.name,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: widget.model.isLoading
                      ? SkeletonList(
                          item: Container(
                          height: 120,
                          width: appWidth,
                          color: AppColors.red,
                          margin: EdgeInsets.symmetric(vertical: 10),
                        ))
                      : Container(
                          height: appHeight * 0.85,
                          child: ListView.builder(
                              itemCount: model.resultFilter.data.length,
                              itemBuilder: (context, index) => PhotoItem(
                                  item: model.resultFilter.data[index])),
                        ))
            ],
          ),
        ),
      ),
    ));
  }
}
