import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late RegisterController controller;
  late MaterialThemeData mTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
    controller = FxControllerStore.putOrFind(RegisterController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: FxContainer(
                color: mTheme.primary,
                marginAll: 0,
                paddingAll: 0,
                child: FxContainer(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(mTheme.containerRadius.large),
                      topLeft: Radius.circular(mTheme.containerRadius.large)),
                  width: MediaQuery.of(context).size.width,
                  margin: FxSpacing.top(220),
                  child: ListView(
                    children: [
                      FxText.h1(
                        'Register',
                        color: mTheme.primary,
                        fontWeight: 700,
                      ),
                      FxSpacing.height(24),
                      Padding(
                        padding: FxSpacing.horizontal(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.b1(
                              'Name',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.name,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              autoIcon: false,
                              filled: false,
                              labelText: "Your name",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.nameController,
                              focusedBorderColor: mTheme.primary,
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: mTheme.primary,
                            ),
                            FxSpacing.height(16),
                            FxText.b1(
                              'Email',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              textFieldType: FxTextFieldType.email,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              autoIcon: false,
                              filled: false,
                              labelText: "Your email id",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 20),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.emailController,
                              focusedBorderColor: mTheme.primary,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: mTheme.primary,
                            ),
                            FxSpacing.height(16),
                            FxText.b1(
                              'Password',
                              fontWeight: 600,
                            ),
                            FxTextField(
                              maxLines: 1,
                              textFieldType: FxTextFieldType.password,
                              textFieldStyle: FxTextFieldStyle.underlined,
                              enabledBorderColor:
                                  theme.colorScheme.onBackground.withAlpha(160),
                              allowSuffixIcon: true,
                              autoIcon: true,
                              filled: false,
                              labelText: "Password",
                              contentPadding: FxSpacing.fromLTRB(0, 8, 4, 2),
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(140),
                              ),
                              isCollapsed: true,
                              controller: controller.passwordController,
                              focusedBorderColor: mTheme.primary,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              cursorColor: mTheme.primary,
                              suffixIconColor: mTheme.primary,
                            ),
                            FxSpacing.height(32),
                            FxButton.block(
                              elevation: 0,
                              borderRadiusAll: mTheme.buttonRadius.large,
                              onPressed: () {
                                controller.goToHomeScreen();
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
                                  controller.goToLoginScreen();
                                },
                                splashColor: mTheme.primary.withAlpha(40),
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
                ),
              ),
            ),
          );
        });
  }
}
