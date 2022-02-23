import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

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
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(ChatController());
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

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
      margin: FxSpacing.nTop(20),
      paddingAll: 20,
      borderRadiusAll: mTheme.containerRadius.medium,
      // color: mTheme.primaryContainer,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                  image: AssetImage(chat.mentor.image),
                ),
              ),
              Positioned(
                right: Language.autoDirection(4),
                left: Language.autoDirection(null, 4),
                bottom: 2,
                child: FxContainer.rounded(
                  paddingAll: 5,
                  child: Container(),
                  color: mTheme.secondary,
                ),
              )
            ],
          ),
          FxSpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(
                  chat.mentor.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.b3(
                  chat.messages.last.text,
                  xMuted: controller.notSeenMessages(chat.messages) == 0,
                  fontWeight: controller.notSeenMessages(chat.messages) == 0
                      ? 400
                      : 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FxText.b3(
                chat.messages.last.time,
                color: theme.colorScheme.onBackground,
                xMuted: true,
                fontSize: 10,
              ),
              controller.notSeenMessages(chat.messages) == 0
                  ? FxSpacing.height(20)
                  : FxContainer.rounded(
                      margin: FxSpacing.top(4),
                      paddingAll: 6,
                      color: mTheme.primary,
                      child: FxText.b3(
                        controller.notSeenMessages(chat.messages).toString(),
                        color: mTheme.onPrimary,
                        fontSize: 10,
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
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: LoadingEffect.getSearchLoadingScreen(context, theme, mTheme),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: FxSpacing.x(20),
              child: TextFormField(
                style: FxTextStyle.b2(),
                cursorColor: theme.colorScheme.onBackground,
                decoration: InputDecoration(
                  hintText: "Search ...",
                  hintStyle:
                      FxTextStyle.b3(color: theme.colorScheme.onBackground),
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
                  filled: true,
                  fillColor: mTheme.primaryContainer,
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  isDense: true,
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            FxSpacing.height(20),
            Expanded(
              child: ListView(
                padding: FxSpacing.zero,
                children: _buildChatList(),
              ),
            ),
            Container(
              padding: FxSpacing.all(20),
              child: FxButton.block(
                backgroundColor: mTheme.primary,
                borderRadiusAll: mTheme.buttonRadius.large,
                elevation: 0,
                splashColor: mTheme.onPrimary.withAlpha(28),
                onPressed: () {},
                child: FxText.l2(
                  'New Message',
                  color: mTheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
