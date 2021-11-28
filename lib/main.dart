import 'package:app_chua/config/provider_manager.dart';
import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/account/base_page.dart';
import 'package:app_chua/ui/pages/account/login.dart';
import 'package:app_chua/ui/pages/dialogue/dialogue_home_page.dart';
import 'package:app_chua/ui/pages/home/home_page.dart';
import 'package:app_chua/ui/pages/loading/loading_page.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light, backgroundColor: AppColors.white),
        navigatorKey: MyRouter.navigatorKey,
        onGenerateRoute: MyRouter.generateRoute,
        home: LoadingPage(),
      ),
    );
  }
}
