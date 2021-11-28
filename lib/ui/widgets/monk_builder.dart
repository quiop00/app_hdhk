import 'package:app_chua/model/monk/monk.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/dialogue/dialogue_by_monk.dart';
import 'package:app_chua/ui/widgets/skeleton.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/list_monk_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MonkBuilder extends StatefulWidget {
  final appHeight;
  final appWidth;
  final onTap;
  MonkBuilder(
      {@required this.appHeight,
      @required this.appWidth,
      @required this.onTap});
  @override
  _MonkBuilderState createState() => _MonkBuilderState();
}

class _MonkBuilderState extends State<MonkBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProviderWidget<ListMonkViewModel>(
          model: ListMonkViewModel(),
          onModelReady: (model) async {
            await model.fetchData();
          },
          builder: (context, model, child) => Container(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            margin: EdgeInsets.only(top: 5),
            height: widget.appHeight * 0.3,
            child: model.isLoading
                ? GridSkeleton(
                    length: 4, crossAxisCount: 4, heightGridItem: 100.0)
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: model.monks.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 15 / 10,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) =>
                                    DialogueByMonk(monk: model.monks[index])));
                          },
                          child: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model.monks[index].name!),
                                SizedBox(height: 5),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                model.monks[index].image!),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
          ),
        ),
        Container(
          width: widget.appWidth,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Divider(
                  thickness: 1,
                  color: AppColors.grey,
                ),
              ),
              Expanded(
                flex: 1,
                child: Divider(
                  thickness: 4,
                  color: AppColors.orange,
                ),
              ),
              Expanded(
                flex: 5,
                child: Divider(
                  thickness: 1,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
