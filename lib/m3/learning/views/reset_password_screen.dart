import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late ResetPasswordController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(ResetPasswordController());
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
    return FxBuilder<ResetPasswordController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    return Scaffold(
      body: ListView(
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 40, 20, 20),
        children: [
          FxText.h3(
            'Reset \nPassword',
            fontWeight: 700,
            color: mTheme.primary,
          ),
          FxSpacing.height(24),
          Center(
            child: Image(
              image: AssetImage(Images.forgotPassword),
              color: mTheme.primary,
              width: 72,
              height: 72,
            ),
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
                      hintText: "Confirm Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.b2(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.confirmPasswordTE,
                  validator: controller.validateConfirmPassword,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: mTheme.buttonRadius.large,
            onPressed: () {
              controller.resetPassword();
            },
            splashColor: mTheme.onPrimary.withAlpha(30),
            backgroundColor: mTheme.primary,
            child: FxText.l1(
              "Reset Password",
              color: mTheme.onPrimary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
