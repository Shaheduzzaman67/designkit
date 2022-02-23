import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late LogInController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(LogInController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(mTheme.textFieldRadius.medium)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<LogInController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding:
            FxSpacing.fromLTRB(16, FxSpacing.safeAreaTop(context) + 36, 16, 16),
        children: [
          FxText.h3(
            'Hello Again! \nWelcome \nback',
            fontWeight: 700,
            color: mTheme.primary,
          ),
          FxSpacing.height(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FxContainer.bordered(
                border: Border.all(
                    color: controller.selectedRole == 1
                        ? mTheme.primary
                        : Colors.transparent),
                /* color: controller.selectedRole == 1
                    ? mTheme.primary.withAlpha(40)
                    : mTheme.primaryContainer,*/
                padding: FxSpacing.xy(28, 20),
                borderRadiusAll: mTheme.containerRadius.medium,
                onTap: () {
                  controller.select(1);
                },
                child: Column(
                  children: [
                    Image(
                      height: 64,
                      width: 64,
                      image: AssetImage(Images.teacher),
                    ),
                    FxSpacing.height(12),
                    FxText.b3(
                      'Teacher',
                      color: controller.selectedRole == 1
                          ? mTheme.primary
                          : theme.colorScheme.onBackground,
                      fontWeight: 600,
                    ),
                  ],
                ),
              ),
              FxContainer.bordered(
                border: Border.all(
                    color: controller.selectedRole == 2
                        ? mTheme.primary
                        : Colors.transparent),
                /* color: controller.selectedRole == 2
                    ? mTheme.primary.withAlpha(40)
                    : mTheme.primaryContainer,*/
                padding: FxSpacing.xy(28, 20),
                borderRadiusAll: mTheme.containerRadius.medium,
                onTap: () {
                  controller.select(2);
                },
                child: Column(
                  children: [
                    Image(
                      height: 64,
                      width: 64,
                      image: AssetImage(Images.student),
                    ),
                    FxSpacing.height(12),
                    FxText.b3(
                      'Student',
                      fontWeight: 600,
                      color: controller.selectedRole == 2
                          ? mTheme.primary
                          : theme.colorScheme.onBackground,
                    ),
                  ],
                ),
              ),
            ],
          ),
          FxSpacing.height(40),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style: FxTextStyle.b2(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      labelStyle: FxTextStyle.b2(),
                      fillColor: mTheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.mail,
                        color: theme.colorScheme.onBackground,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: mTheme.onPrimaryContainer,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style: FxTextStyle.b2(),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: mTheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.onBackground,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.passwordTE,
                  validator: controller.validatePassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          FxSpacing.height(20),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: mTheme.buttonRadius.large,
            onPressed: () {
              controller.login();
            },
            splashColor: mTheme.onPrimary.withAlpha(30),
            backgroundColor: mTheme.primary,
            child: FxText.l1(
              "Sign In",
              color: mTheme.onPrimary,
            ),
          ),
          FxSpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxButton.text(
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                padding: FxSpacing.zero,
                splashColor: mTheme.primary.withAlpha(40),
                child: FxText.b3("Forgot your Password ?",
                    color: mTheme.primary,
                    decoration: TextDecoration.underline),
              ),
              FxButton.text(
                onPressed: () {
                  controller.goToRegisterScreen();
                },
                padding: FxSpacing.zero,
                splashColor: mTheme.primary.withAlpha(40),
                child: FxText.b3(
                  "Sign up",
                  color: mTheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
