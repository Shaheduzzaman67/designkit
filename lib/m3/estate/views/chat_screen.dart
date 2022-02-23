import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/chat_controller.dart';
import '../models/chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(ChatController());
    mTheme = MaterialTheme.estateTheme;
    theme = AppTheme.theme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Chat chat in controller.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return FxContainer(
      onTap: () {
        controller.goToSingleChatScreen(chat);
      },
      margin: FxSpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: mTheme.containerRadius.medium,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.image),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: FxContainer.rounded(
                  paddingAll: 5,
                  child: Container(),
                  color: mTheme.primary,
                ),
              )
            ],
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(
                  chat.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.b3(
                  chat.chat,
                  xMuted: chat.replied,
                  muted: !chat.replied,
                  fontWeight: chat.replied ? 400 : 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FxText.b3(
                chat.time,
                fontSize: 10,
                color: theme.colorScheme.onBackground,
                xMuted: true,
              ),
              chat.replied
                  ? FxSpacing.height(16)
                  : FxContainer.rounded(
                      paddingAll: 6,
                      color: mTheme.primary,
                      child: FxText.b3(
                        chat.messages,
                        fontSize: 10,
                        color: mTheme.onPrimary,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ChatController>(
        controller: controller,
        builder: (estateHomeController) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: Container(
                padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: estateHomeController.showLoading
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
          child: LoadingEffect.getSearchLoadingScreen(
        context,
        theme,
        mTheme,
      ));
    } else {
      return ListView(
        padding: FxSpacing.x(20),
        children: [
          FxSpacing.height(16),
          Center(
            child: FxText.b1(
              'Chats',
              fontWeight: 700,
            ),
          ),
          FxSpacing.height(16),
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search your agent...',
            focusedBorderColor: mTheme.primary,
            enabledBorderRadius: mTheme.containerRadius.medium,
            focusedBorderRadius: mTheme.containerRadius.medium,
            cursorColor: mTheme.primary,
            labelStyle:
                FxTextStyle.b3(color: mTheme.onPrimaryContainer, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: mTheme.primaryContainer,
            suffixIcon: Icon(
              FeatherIcons.search,
              color: mTheme.primary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      );
    }
  }
}
