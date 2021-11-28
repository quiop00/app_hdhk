import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/mixin/input_validation_mixin.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/account/base_page.dart';
import 'package:app_chua/ui/pages/account/widgets/header_image.dart';
import 'package:app_chua/ui/pages/account/widgets/input_field.dart';
import 'package:app_chua/ui/pages/account/widgets/sign_in_facebook.dart';
import 'package:app_chua/ui/pages/account/widgets/submit_button.dart';
import 'package:app_chua/ui/widgets/modal_processing.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/account_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  AccountViewModel model;
  LoginPage({required this.model});
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> with InputValidationMixin {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool enableButton;
  @override
  void initState() {
    enableButton = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SignInFaceBook(),
          SizedBox(
            height: 20,
          ),
          Text('or'),
          Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputField(
                    controller: _email,
                    onChange: onChangeHandle,
                    validator: (input) {
                      if (!isEmailValid(input!)) {
                        return 'Địa chỉ email không chính xác';
                      }
                      return 'null';
                    },
                    hint: 'Email Address',
                    type: TextInputType.emailAddress,
                  ),
                  InputField(
                    controller: _password,
                    onChange: onChangeHandle,
                    validator: (input) {
                      if (!isPasswordValid(input!)) {
                        return 'Độ dài password tối thiểu 6 ký tự';
                      }
                      return '';
                    },
                    hint: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubmitButton(
                      submit: enableButton
                          ? () async {
                              showLoading(context);
                              await widget.model.login();
                              Navigator.pop(context);
                              MyRouter.replaceWith(RouteName.home);
                            }
                          : null,
                      title: 'Sign In'),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      widget.model.changeType(AccountPageType.forgotPassword);
                    },
                    child: Text(
                      'Forgot your password? ',
                      style: TextStyle(color: AppColors.lightRed),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create new account? ',
                        style: TextStyle(color: AppColors.black, fontSize: 18),
                      ),
                      InkWell(
                          onTap: () {
                            widget.model.changeType(AccountPageType.register);
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: AppColors.lightRed, fontSize: 18)))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  onChangeHandle(value) {
    setState(() {
      enableButton = _formKey.currentState?.validate() ?? false;
    });
  }
}
