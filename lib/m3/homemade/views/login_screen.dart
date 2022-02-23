import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late LogInController logInController;
  late MaterialThemeData mTheme;
  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
    logInController = FxControllerStore.putOrFind(LogInController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: logInController,
        builder: (logInController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.h3(
                  'Hello !\nWelcome to homemade App',
                  color: mTheme.primary,
                  fontWeight: 700,
                ),
                FxSpacing.height(80),
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
                        enabledBorderRadius: mTheme.containerRadius.large,
                        focusedBorderRadius: mTheme.containerRadius.large,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.password,
                        suffixIconColor: mTheme.primary,
                        filled: true,
                        enabledBorderRadius: mTheme.containerRadius.large,
                        focusedBorderRadius: mTheme.containerRadius.large,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                      ),
                      FxSpacing.height(16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FxButton.text(
                          onPressed: () {
                            logInController.goToForgotPassword();
                          },
                          padding: FxSpacing.y(4),
                          splashColor: mTheme.primaryContainer,
                          child: FxText.b3("Forgot Password?",
                              color: mTheme.primary),
                        ),
                      ),
                      FxSpacing.height(16),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: mTheme.buttonRadius.large,
                        onPressed: () {
                          logInController.login();
                        },
                        backgroundColor: mTheme.primary,
                        splashColor: mTheme.primaryContainer,
                        child: FxText.b2(
                          "LOG IN",
                          fontWeight: 700,
                          color: mTheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            logInController.goToRegister();
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
