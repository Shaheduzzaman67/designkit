import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late EditProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(EditProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<EditProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context, theme, mTheme),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: FxText.b1(
            'Personal Data',
            fontWeight: 600,
          ),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ).autoDirection(),
          ),
        ),
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: [
            Center(
              child: FxContainer(
                color: Colors.transparent,
                paddingAll: 0,
                height: 100,
                width: 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(Images.learningProfile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: Language.autoDirection(null, 0),
                      right: Language.autoDirection(0),
                      child: FxCard(
                        paddingAll: 2,
                        borderRadiusAll: 4,
                        clipBehavior: Clip.none,
                        child: FxContainer(
                          paddingAll: 4,
                          borderRadiusAll: 4,
                          color: mTheme.primaryContainer,
                          child: Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: mTheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            FxText.b2(
              'Your Name',
            ),
            FxSpacing.height(8),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              autoIcon: false,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.name,
              filled: true,
              isDense: true,
              isCollapsed: true,
              maxLines: 1,
              labelStyle: FxTextStyle.b3(xMuted: true),
              fillColor: mTheme.primaryContainer,
              focusedBorderColor: mTheme.primary,
              enabledBorderColor: mTheme.primary,
              labelTextColor: theme.colorScheme.onBackground,
              cursorColor: theme.colorScheme.onBackground,
              focusedBorderRadius: mTheme.textFieldRadius.medium,
              enabledBorderRadius: mTheme.textFieldRadius.medium,
            ),
            FxSpacing.height(20),
            FxText.b2(
              'Address',
            ),
            FxSpacing.height(8),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              autoIcon: false,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.name,
              filled: true,
              isDense: true,
              isCollapsed: true,
              labelText: 'Address',
              maxLines: 1,
              labelStyle: FxTextStyle.b3(xMuted: true),
              fillColor: mTheme.primaryContainer,
              focusedBorderColor: mTheme.primary,
              enabledBorderColor: mTheme.primary,
              labelTextColor: theme.colorScheme.onBackground,
              cursorColor: theme.colorScheme.onBackground,
              focusedBorderRadius: mTheme.textFieldRadius.medium,
              enabledBorderRadius: mTheme.textFieldRadius.medium,
            ),
            FxSpacing.height(20),
            FxText.b2(
              'Email',
            ),
            FxSpacing.height(8),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              autoIcon: false,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.email,
              filled: true,
              isDense: true,
              isCollapsed: true,
              maxLines: 1,
              labelStyle: FxTextStyle.b3(xMuted: true),
              fillColor: mTheme.primaryContainer,
              focusedBorderColor: mTheme.primary,
              enabledBorderColor: mTheme.primary,
              labelTextColor: theme.colorScheme.onBackground,
              cursorColor: theme.colorScheme.onBackground,
              focusedBorderRadius: mTheme.textFieldRadius.medium,
              enabledBorderRadius: mTheme.textFieldRadius.medium,
            ),
            FxSpacing.height(20),
            FxText.b2(
              'Mobile Number',
            ),
            FxSpacing.height(8),
            FxTextField(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              autoFocusedBorder: true,
              autoIcon: false,
              textFieldStyle: FxTextFieldStyle.outlined,
              textFieldType: FxTextFieldType.mobileNumber,
              filled: true,
              isDense: true,
              isCollapsed: true,
              labelText: 'Number',
              maxLines: 1,
              labelStyle: FxTextStyle.b3(xMuted: true),
              fillColor: mTheme.primaryContainer,
              focusedBorderColor: mTheme.primary,
              enabledBorderColor: mTheme.primary,
              labelTextColor: theme.colorScheme.onBackground,
              cursorColor: theme.colorScheme.onBackground,
              focusedBorderRadius: mTheme.textFieldRadius.medium,
              enabledBorderRadius: mTheme.textFieldRadius.medium,
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.b2(
                        'Gender',
                      ),
                      FxSpacing.height(8),
                      Row(
                        children: [
                          FxContainer.rounded(
                            onTap: () {
                              controller.changeGender(Gender.male);
                            },
                            paddingAll: 12,
                            color: controller.gender == Gender.male
                                ? mTheme.primary
                                : mTheme.primaryContainer,
                            child: Icon(
                              Icons.male,
                              color: controller.gender == Gender.male
                                  ? mTheme.onPrimary
                                  : theme.colorScheme.onBackground
                                      .withAlpha(150),
                            ),
                          ),
                          FxSpacing.width(20),
                          FxContainer.rounded(
                            onTap: () {
                              controller.changeGender(Gender.female);
                            },
                            paddingAll: 12,
                            color: controller.gender == Gender.female
                                ? mTheme.primary
                                : mTheme.primaryContainer,
                            child: Icon(
                              Icons.female,
                              color: controller.gender == Gender.female
                                  ? mTheme.onPrimary
                                  : theme.colorScheme.onBackground
                                      .withAlpha(150),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.b2(
                        'Age',
                      ),
                      FxSpacing.height(8),
                      FxTextField(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        autoFocusedBorder: true,
                        autoIcon: false,
                        textFieldStyle: FxTextFieldStyle.outlined,
                        textFieldType: FxTextFieldType.mobileNumber,
                        filled: true,
                        isDense: true,
                        isCollapsed: true,
                        labelText: 'Age',
                        maxLines: 1,
                        labelStyle: FxTextStyle.b3(xMuted: true),
                        fillColor: mTheme.primaryContainer,
                        focusedBorderColor: mTheme.primary,
                        enabledBorderColor: mTheme.primary,
                        labelTextColor: theme.colorScheme.onBackground,
                        cursorColor: theme.colorScheme.onBackground,
                        focusedBorderRadius: mTheme.textFieldRadius.medium,
                        enabledBorderRadius: mTheme.textFieldRadius.medium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            FxButton.block(
              onPressed: () {
                controller.goBack();
              },
              elevation: 0,
              borderRadiusAll: mTheme.buttonRadius.large,
              splashColor: mTheme.onPrimary.withAlpha(40),
              backgroundColor: mTheme.primary,
              child: FxText.b2(
                'Submit',
                fontWeight: 600,
                color: mTheme.onPrimary,
              ),
            ),
          ],
        ),
      );
    }
  }
}
