import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController registerController;
  late MaterialThemeData mTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
    registerController = FxControllerStore.putOrFind(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: registerController,
        builder: (registerController) {
          return Scaffold(
            body: ListView(
              padding: FxSpacing.fromLTRB(24, 44, 24, 0),
              children: [
                FxText.h3(
                  'Hey !\nSignup to get started',
                  color: mTheme.primary,
                  fontWeight: 700,
                ),
                FxSpacing.height(60),
                Padding(
                  padding: FxSpacing.horizontal(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.name,
                        filled: true,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                        focusedBorderRadius: mTheme.containerRadius.large,
                        enabledBorderRadius: mTheme.containerRadius.large,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.email,
                        filled: true,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                        focusedBorderRadius: mTheme.containerRadius.large,
                        enabledBorderRadius: mTheme.containerRadius.large,
                      ),
                      FxSpacing.height(24),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.password,
                        suffixIconColor: mTheme.primary,
                        filled: true,
                        fillColor: mTheme.primaryContainer,
                        enabledBorderColor: mTheme.primary,
                        focusedBorderColor: mTheme.primary,
                        prefixIconColor: mTheme.primary,
                        labelTextColor: mTheme.primary,
                        cursorColor: mTheme.primary,
                        focusedBorderRadius: mTheme.containerRadius.large,
                        enabledBorderRadius: mTheme.containerRadius.large,
                      ),
                      FxSpacing.height(32),
                      FxButton.block(
                        elevation: 0,
                        borderRadiusAll: mTheme.buttonRadius.large,
                        onPressed: () {
                          registerController.register();
                        },
                        backgroundColor: mTheme.primary,
                        child: FxText.t2(
                          "REGISTER",
                          fontWeight: 700,
                          color: mTheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                      FxSpacing.height(16),
                      Center(
                        child: FxButton.text(
                          onPressed: () {
                            registerController.goToLogin();
                          },
                          splashColor: mTheme.primaryContainer,
                          child: FxText.b3("I already have an account",
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
