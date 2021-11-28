import 'package:app_chua/enums/account_page_type.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends ChangeNotifier {
  AccountPageType type = AccountPageType.login;
  changeType(type) {
    this.type = type;
    notifyListeners();
  }

  login() async {
    //api call
    await Future.delayed(Duration(milliseconds: 5000));
  }

  register() async {}
  resetPassword() async {}
}
