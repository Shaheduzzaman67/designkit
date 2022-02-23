import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/single_chat_controller.dart';
import '../models/chat.dart';
import '../models/message.dart';

class SingleChatScreen extends StatefulWidget {
  final Chat chat;

  const SingleChatScreen(
    this.chat, {
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
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(SingleChatController(widget.chat));
  }

  Widget _buildMessageList() {
    List<Widget> list = [];
    for (int i = 0; i < controller.chat.messages.length; i++) {
      list.add(_buildSingleMessage(controller.chat.messages[i]));
    }
    return ListView(
      padding: FxSpacing.x(20),
      children: list,
    );
  }

  Widget _buildSingleMessage(Message message) {
    bool isMentor = controller.fromMentor(message);
    return Align(
      alignment: isMentor ? Alignment.centerLeft : Alignment.centerRight,
      child: FxContainer(
        color: isMentor ? mTheme.primaryContainer : mTheme.secondaryContainer,
        paddingAll: 12,
        borderRadiusAll: mTheme.containerRadius.large,
        margin: FxSpacing.y(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FxText.b3(
              message.text,
              color: isMentor ? mTheme.primary : theme.colorScheme.onBackground,
            ),
            FxSpacing.width(8),
            FxText.b3(
              message.time,
              xMuted: true,
              fontWeight: 600,
              fontSize: 10,
              color: isMentor ? mTheme.primary : theme.colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleChatController>(
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
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
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
                        color: theme.colorScheme.onBackground,
                      ).autoDirection(),
                    ),
                    FxSpacing.width(16),
                    FxContainer.rounded(
                      paddingAll: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage(controller.chat.mentor.image),
                      ),
                    ),
                    FxSpacing.width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b2(
                          controller.chat.mentor.name,
                          fontWeight: 600,
                        ),
                        FxSpacing.height(4),
                        FxText.b3(
                          controller.chat.mentor.position,
                          muted: true,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FxSpacing.height(8),
              Divider(),
              Expanded(child: _buildMessageList()),
              Padding(
                padding: FxSpacing.nTop(20),
                child: FxTextField(
                  focusedBorderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  cursorColor: mTheme.primary,
                  textFieldStyle: FxTextFieldStyle.outlined,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(mTheme.containerRadius.large),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(mTheme.containerRadius.large),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(mTheme.containerRadius.large),
                      ),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0)),
                  labelText: 'Send a Message ...',
                  labelStyle: FxTextStyle.b3(
                      color: theme.colorScheme.onBackground, xMuted: true),
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
          ),
        ),
      );
    }
  }
}
