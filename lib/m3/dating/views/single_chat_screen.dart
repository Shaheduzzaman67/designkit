import 'dart:developer';

import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_chat_controller.dart';
import '../models/profile.dart';

class SingleChatScreen extends StatefulWidget {
  final Profile profile;

  const SingleChatScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late SingleChatController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<SingleChatController>(
        SingleChatController(widget.profile));
    theme = AppTheme.theme;
    mTheme = MaterialTheme.datingTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleChatController>(
        controller: controller,
        builder: (controller) {
          return Theme(
              data: theme.copyWith(
                  colorScheme:
                      theme.colorScheme.copyWith(secondary: mTheme.primary)),
              child: _buildBody());
        });
  }

  Widget _buildSingleTime(String time) {
    return Align(
        alignment: Alignment.center,
        child: FxText.b3(
          time,
          xMuted: true,
          fontWeight: 600,
          fontSize: 10,
        ));
  }

  Widget _buildSingleMessage(String message,
      AlignmentGeometry alignmentGeometry, Color bgColor, Color textColor) {
    return Align(
      alignment: alignmentGeometry,
      child: FxContainer(
        color: bgColor,
        paddingAll: 12,
        borderRadiusAll: mTheme.containerRadius.medium,
        margin: FxSpacing.y(8),
        child: FxText.b3(
          message,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: FxSpacing.top(24),
              child: LoadingEffect.getProductLoadingScreen(
                context,
                theme,
                mTheme,
              )));
    } else {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: Column(
            children: [
              Padding(
                padding: FxSpacing.x(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.goBack();
                      },
                      child: Icon(
                        FeatherIcons.chevronLeft,
                        size: 20,
                        color: mTheme.primary,
                      ),
                    ),
                    FxSpacing.width(12),
                    FxContainer.rounded(
                      paddingAll: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage(controller.profile.image),
                      ),
                    ),
                    FxSpacing.width(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b3(
                          controller.profile.name +
                              ', ' +
                              controller.profile.age.toString(),
                          fontWeight: 600,
                        ),
                        FxSpacing.height(4),
                        FxText.b3(
                          controller.profile.profession +
                              ', ' +
                              controller.profile.companyName,
                          fontSize: 10,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(8),
              Divider(
                thickness: 1.2,
                color: mTheme.card,
              ),
              Expanded(
                child: ListView(
                  padding: FxSpacing.all(24),
                  children: [
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        mTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleTime('08:35'),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        mTheme.primaryContainer,
                        mTheme.primary),
                    _buildSingleTime('08:37'),
                    _buildSingleMessage(
                        'For sure, how about this \nbeautiful place?',
                        Alignment.centerLeft,
                        mTheme.card,
                        theme.colorScheme.onBackground),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: mTheme.containerRadius.medium,
                        margin: FxSpacing.y(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 120,
                          width: 250,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/location.png'),
                        ),
                      ),
                    ),
                    _buildSingleMessage('Perfect!!', Alignment.centerRight,
                        mTheme.primaryContainer, mTheme.primary),
                    _buildSingleTime('08:42'),
                    _buildSingleMessage(
                        'What time should we be there?',
                        Alignment.centerLeft,
                        mTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Are you free tonight?',
                        Alignment.centerLeft,
                        mTheme.card,
                        theme.colorScheme.onBackground),
                    _buildSingleMessage(
                        'Yes, should we meet?',
                        Alignment.centerRight,
                        mTheme.primaryContainer,
                        mTheme.primary),
                  ],
                ),
              ),
              FxContainer(
                paddingAll: 0,
                margin: FxSpacing.nTop(16),
                child: FxTextField(
                  focusedBorderColor: mTheme.primary,
                  cursorColor: mTheme.primary,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  labelText: 'Type Something ...',
                  labelStyle: FxTextStyle.b3(
                      color: theme.colorScheme.onBackground, muted: true),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  fillColor: mTheme.card,
                  enabledBorderRadius: mTheme.containerRadius.medium,
                  focusedBorderRadius: mTheme.containerRadius.medium,
                  suffixIcon: Icon(
                    FeatherIcons.send,
                    color: mTheme.primary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
