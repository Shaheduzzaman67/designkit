import 'package:flutkit/m3/cookify/controllers/register_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late RegisterController controller;
  late OutlineInputBorder outlineInputBorder;
  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(RegisterController());
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
    return FxBuilder<RegisterController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding: FxSpacing.fromLTRB(24, 100, 24, 0),
        children: [
          FxTwoToneIcon(
            FxTwoToneMdiIcons.menu_book,
            color: mTheme.primary,
            size: 64,
          ),
          FxSpacing.height(20),
          FxText.h3(
            "Create an Account",
            color: mTheme.primary,
            fontWeight: 800,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  style: FxTextStyle.b2(color: mTheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: mTheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.user,
                        color: mTheme.primary,
                      ),
                      hintText: "Name",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(color: mTheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.nameTE,
                  validator: controller.validateName,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style: FxTextStyle.b2(color: mTheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: mTheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.mail,
                        color: mTheme.primary,
                      ),
                      hintText: "Email Address",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(color: mTheme.primary),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.emailTE,
                  validator: controller.validateEmail,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                FxSpacing.height(20),
                TextFormField(
                  style: FxTextStyle.b2(color: mTheme.primary),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: mTheme.primaryContainer,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: mTheme.primary,
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(color: mTheme.primary),
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
          Align(
            alignment: Alignment.centerRight,
            child: FxButton.text(
                padding: FxSpacing.zero,
                onPressed: () {
                  controller.goToForgotPasswordScreen();
                },
                splashColor: mTheme.primaryContainer,
                child: FxText.b3("Forgot Password?", color: mTheme.primary)),
          ),
          FxSpacing.height(20),
          FxButton.block(
              borderRadiusAll: mTheme.buttonRadius.large,
              onPressed: () {
                controller.register();
              },
              elevation: 0,
              backgroundColor: mTheme.primary,
              child: FxText.l1(
                "Create an Account",
                color: mTheme.onPrimary,
              )),
          FxSpacing.height(20),
          FxButton.text(
              onPressed: () {
                controller.goToLogInScreen();
              },
              splashColor: mTheme.primaryContainer,
              child: FxText.l2("I have already an account",
                  decoration: TextDecoration.underline, color: mTheme.primary)),
          FxSpacing.height(20),
        ],
      ),
    );
  }
}
