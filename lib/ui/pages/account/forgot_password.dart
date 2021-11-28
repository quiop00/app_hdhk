import 'package:app_chua/enums/account_page_type.dart';
import 'package:app_chua/mixin/input_validation_mixin.dart';
import 'package:app_chua/ui/pages/account/widgets/input_field.dart';
import 'package:app_chua/ui/pages/account/widgets/submit_button.dart';
import 'package:app_chua/ui/widgets/modal_processing.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/account_view_model.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  final AccountViewModel model;
  ForgotPasswordPage({required this.model});
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPage();
  }
}

class _ForgotPasswordPage extends State<ForgotPasswordPage>
    with InputValidationMixin {
  TextEditingController _email = TextEditingController();
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
          SizedBox(
            height: 20,
          ),
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
                      return null;
                    },
                    hint: 'Email Address',
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SubmitButton(
                      submit: enableButton
                          ? () async {
                              showLoading(context);
                              await widget.model.resetPassword();
                              Navigator.pop(context);
                            }
                          : null,
                      title: 'Reset'),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Back to login? ',
                        style: TextStyle(color: AppColors.black, fontSize: 18),
                      ),
                      InkWell(
                          onTap: () {
                            widget.model.changeType(AccountPageType.login);
                          },
                          child: Text('Sign In',
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
