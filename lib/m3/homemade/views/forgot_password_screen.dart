import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late ForgotPasswordController forgotPasswordController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
    forgotPasswordController =
        FxControllerStore.putOrFind(ForgotPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ForgotPasswordController>(
        controller: forgotPasswordController,
        builder: (forgotPasswordController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.h3(
                  'Oops! \nForgot Password?',
                  color: mTheme.primary,
                  fontWeight: 700,
                ),
                FxSpacing.height(150),
                Padding(
                  padding: FxSpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.email,
                        filled: true,
                        enabledBorderRadius: mTheme.buttonRadius.large,
                        focusedBorderRadius: mTheme.buttonRadius.large,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                      ),
                      FxSpacing.height(24),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: mTheme.buttonRadius.large,
                        onPressed: () {
                          forgotPasswordController.forgotPassword();
                        },
                        backgroundColor: mTheme.primary,
                        child: FxText.t2(
                          "Forgot Password",
                          fontWeight: 700,
                          color: mTheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            forgotPasswordController.goToRegister();
                          },
                          splashColor: mTheme.primaryContainer,
                          child: FxText.b3("I haven\'t an account",
                              decoration: TextDecoration.underline,
                              color: mTheme.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
