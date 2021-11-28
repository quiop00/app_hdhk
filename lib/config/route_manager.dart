import 'package:app_chua/config/core/fade_route.dart';
import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/ui/pages/account/base_page.dart';
import 'package:app_chua/ui/pages/account/login.dart';
import 'package:app_chua/ui/pages/account/register.dart';
import 'package:app_chua/ui/pages/contact/contact_page.dart';
import 'package:app_chua/ui/pages/dialogue/dialogue_home_page.dart';
import 'package:app_chua/ui/pages/event/event_page.dart';
import 'package:app_chua/ui/pages/exbihition/exhibition_page.dart';
import 'package:app_chua/ui/pages/history/history_home.dart';
import 'package:app_chua/ui/pages/home/home_page.dart';
import 'package:app_chua/ui/pages/layout/layout.dart';
import 'package:app_chua/ui/pages/library/library_page.dart';
import 'package:app_chua/ui/pages/profile/notification_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteName {
  static const String splash = "/";
  static const String home = "home";
  static const String login = "login";
  static const String register = "register";
  static const String resetPassword = "resetPassword";
  static const String notification = "notification";
  static const String dialogue = 'dialogue';
  static const String library = "library";
  static const String event = "event";
  static const String favourite = "favourite";
  static const String profile = "profile";
  static const String history = "history";
  static const String exhibition = "exhibition";
  static const String contact = "contact";
}

class MyRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings router) {
    return getRoute(router.name);
  }

  static Route<dynamic> getRoute(String? path) {
    switch (path) {
      case RouteName.login:
        {
          return FadeRoute(page: BaseAccount());
        }
      case RouteName.register:
        return FadeRoute(
            page: BaseAccount(
          type: AccountPageType.register,
        ));
      case RouteName.home:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: HomePage()));
      case RouteName.history:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: HistoryHome()));
      case RouteName.notification:
        return CupertinoPageRoute(builder: (context) => NotificationPage());
      case RouteName.dialogue:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: DialoguePage()));
      case RouteName.event:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: EventPage()));
      case RouteName.library:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: LibraryPage()));
      case RouteName.exhibition:
        return CupertinoPageRoute(
            builder: (context) => AppLayout(child: ExhibitionPage()));
      case RouteName.contact:
        return CupertinoPageRoute(builder: (context) => AppLayout(child: ContactPage(),));
      default:
        {
          return FadeRoute(
              page: BaseAccount(
            type: AccountPageType.register,
          ));
        }
    }
  }

  static NavigatorState? get state => navigatorKey.currentState;
  static Future pushName<T>(String path, [T? arguments]) =>
      state!.pushNamed(path, arguments: arguments);
  static Future replaceWith<T>(String path, [T? arguments]) =>
      state!.pushReplacementNamed(path, arguments: arguments);
  static void pop() => state!.pop();
}
