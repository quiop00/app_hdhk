import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/dialogue/dialogue_home_page.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/exhibition_filter_dialog.dart';
import 'package:app_chua/ui/pages/exbihition/widgets/tab_view_content.dart';
import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/layout/tab_manager.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/exhibition_view_model.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExhibitionPage extends StatefulWidget {
  @override
  _ExhibitionPageState createState() => _ExhibitionPageState();
}

class _ExhibitionPageState extends State<ExhibitionPage> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ProviderWidget<ExhibitionViewModel>(
      model: ExhibitionViewModel(),
      onModelReady: (model) async {
        await model.loadExhibitionAuthor();
      },
      builder: (context, model, _) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => context.read<Pop>().onBack(),
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
          child: TabViewContent(
            model: model,
            appHeight: appHeight,
          ),
        ),
      ),
    ));
  }
}
