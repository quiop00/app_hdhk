import 'package:app_chua/config/route_manager.dart';
import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/mixin/input_validation_mixin.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/ui/pages/account/widgets/input_field.dart';
import 'package:app_chua/ui/pages/account/widgets/sign_in_facebook.dart';
import 'package:app_chua/ui/pages/account/widgets/submit_button.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/account_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_page.dart';

class RegisterPage extends StatefulWidget {
  AccountViewModel model;
  RegisterPage({required this.model});
  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> with InputValidationMixin {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late bool enableButton;
  late bool _agree;
  @override
  void initState() {
    enableButton = false;
    _agree = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fieldNameWidth = MediaQuery.of(context).size.width * 0.8 / 2 - 5;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SignInFaceBook(),
          SizedBox(
            height: 10,
          ),
          Text('or'),
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: fieldNameWidth,
                      child: InputField(
                        controller: _firstName,
                        onChange: onChangeHandle,
                        validator: (input) {
                          if (!isNameValid(input!)) {
                            return 'Không được để trống';
                          }
                          return null;
                        },
                        hint: 'First Name',
                      ),
                    ),
                    Container(
                      width: fieldNameWidth,
                      child: InputField(
                        controller: _lastName,
                        onChange: onChangeHandle,
                        validator: (input) {
                          if (!isNameValid(input!)) {
                            return 'Không được để trống';
                          }
                          return null;
                        },
                        hint: 'Last Name',
                      ),
                    ),
                  ],
                ),
                InputField(
                  controller: _email,
                  onChange: onChangeHandle,
                  validator: (input) {
                    if (!isEmailValid(input!)) {
                      return 'Địa chỉ email không chính xác';
                    }
                    return null;
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
                    return null;
                  },
                  hint: 'Password',
                  obscureText: true,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _agree,
                        onChanged: (value) {
                          setState(() {
                            _agree = value!;
                          });
                        }),
                    const Text('I agree with term and policy')
                  ],
                ),
                SubmitButton(
                    submit: _agree && enableButton ? () {} : null,
                    title: 'Sign Up'),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account? ',
                      style: TextStyle(color: AppColors.black, fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          widget.model.changeType(AccountPageType.login);
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                                color: AppColors.lightRed, fontSize: 16)))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  onChangeHandle(value) {
    setState(() {
      enableButton = _formKey.currentState?.validate() ?? false;
      print(enableButton);
    });
  }
}
