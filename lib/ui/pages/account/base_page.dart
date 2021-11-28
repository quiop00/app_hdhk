import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/account/login.dart';
import 'package:app_chua/ui/pages/account/register.dart';
import 'package:app_chua/ui/pages/account/widgets/header_image.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgot_password.dart';

class BaseAccount extends StatefulWidget {
  final AccountPageType type;
  BaseAccount({this.type = AccountPageType.login});

  @override
  State<StatefulWidget> createState() {
    return _BaseAccount();
  }
}

class _BaseAccount extends State<BaseAccount> {
  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.3;
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: appHeight,
          child: Stack(
            children: [
              HeaderImage(
                height: headerHeight,
              ),
              ProviderWidget<AccountViewModel>(
                  model: AccountViewModel(),
                  builder: (context, AccountViewModel model, child) {
                    print(model.type);
                    return Positioned(
                        top: headerHeight - 40,
                        child: Container(
                          height: appHeight,
                          width: appWidth,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              color: AppColors.white),
                          child: getChild(model),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget getChild(model) {
    print(model.type);
    var type = model.type ?? widget.type;
    switch (type) {
      case AccountPageType.register:
        return RegisterPage(
          model: model,
        );
      case AccountPageType.forgotPassword:
        return ForgotPasswordPage(
          model: model,
        );
      default:
        return LoginPage(
          model: model,
        );
    }
  }
}
