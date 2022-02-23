import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/single_chat_controller.dart';
import '../models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SingleChatScreen extends StatefulWidget {
  final Chat chat;

  const SingleChatScreen(this.chat);

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
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
    controller = FxControllerStore.putOrFind(SingleChatController(widget.chat));
  }

  Widget _buildReceiveMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FxContainer(
              color: mTheme.primaryContainer,
              margin: FxSpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(mTheme.containerRadius.medium),
                  bottomRight: Radius.circular(mTheme.containerRadius.medium),
                  bottomLeft: Radius.circular(mTheme.containerRadius.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.b3(
                    message!,
                    color: mTheme.onPrimaryContainer,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.b3(
                      time!,
                      fontSize: 10,
                      color: mTheme.onPrimaryContainer,
                      xMuted: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxContainer(
              color: mTheme.primary,
              margin: FxSpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(mTheme.containerRadius.medium),
                  bottomRight: Radius.circular(mTheme.containerRadius.medium),
                  bottomLeft: Radius.circular(mTheme.containerRadius.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.b3(
                    message!,
                    color: mTheme.onPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.b3(
                      time!,
                      fontSize: 10,
                      color: mTheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleChatController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: Padding(
                padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: mTheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
            theme,
            mTheme,
          ));
    } else {
      return Column(
        children: [
          FxContainer(
            color: theme.scaffoldBackgroundColor,
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                FxSpacing.width(8),
                FxContainer.rounded(
                  paddingAll: 0,
                  child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage(controller.chat.image),
                  ),
                ),
                FxSpacing.width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.b2(
                        controller.chat.name,
                        fontWeight: 600,
                      ),
                      FxSpacing.height(2),
                      Row(
                        children: [
                          FxContainer.rounded(
                            paddingAll: 3,
                            color: mTheme.primary,
                            child: Container(),
                          ),
                          FxSpacing.width(4),
                          FxText.b3(
                            'Online',
                            color: theme.colorScheme.onBackground,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FxSpacing.width(16),
                FxContainer.rounded(
                    color: mTheme.primary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.videocam_rounded,
                      color: mTheme.onPrimary,
                      size: 16,
                    )),
                FxSpacing.width(8),
                FxContainer.rounded(
                  color: mTheme.primary,
                  paddingAll: 8,
                  child: Icon(
                    Icons.call,
                    color: mTheme.onPrimary,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildReceiveMessage(
                  message: 'Yes, What help do you need?', time: '08:25'),
              FxSpacing.height(16),
              _buildSendMessage(
                  message: 'Should I come to meet you tomorrow?',
                  time: '08:30'),
              FxSpacing.height(16),
              _buildReceiveMessage(
                  message: 'Yes sure, you can come after 2:00 pm',
                  time: '08:35'),
              FxSpacing.height(16),
              _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
              FxSpacing.height(24),
            ],
          )),
          FxContainer(
            marginAll: 24,
            paddingAll: 0,
            borderRadiusAll: mTheme.containerRadius.medium,
            child: FxTextField(
              focusedBorderColor: mTheme.primary,
              cursorColor: mTheme.primary,
              enabledBorderRadius: mTheme.containerRadius.medium,
              focusedBorderRadius: mTheme.containerRadius.medium,
              textFieldStyle: FxTextFieldStyle.outlined,
              labelText: 'Type Something ...',
              labelStyle: FxTextStyle.b3(color: mTheme.primary, xMuted: true),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: mTheme.primaryContainer,
              suffixIcon: Icon(
                FeatherIcons.send,
                color: mTheme.primary,
                size: 20,
              ),
            ),
          ),
        ],
      );
    }
  }
}
