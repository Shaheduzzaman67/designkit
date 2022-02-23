import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatProfileScreen extends StatefulWidget {
  @override
  _ChatProfileScreenState createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              MdiIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: FxText.b1("Account",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: FxSpacing.fromLTRB(20, 0, 20, 0),
                child: FxText.caption("REQUESTS",
                    fontWeight: 600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: FxSpacing.fromLTRB(0, 20, 0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: FxSpacing.left(20),
                        child: singleRequest(
                            option: "Block",
                            image: './assets/images/profile/avatar_1.jpg',
                            name: "Sohaib Sumner",
                            status: "Unknown"),
                      ),
                      Container(
                        margin: FxSpacing.left(20),
                        child: singleRequest(
                            option: "Accept",
                            image: './assets/images/profile/avatar_3.jpg',
                            name: "Donald Diaz",
                            status: "3 Friend Mutual"),
                      ),
                      Container(
                        margin: FxSpacing.left(20),
                        child: singleRequest(
                            option: "Accept",
                            image: './assets/images/profile/avatar_4.jpg',
                            name: "Emilis Fuller",
                            status: "8 Friend Mutual"),
                      ),
                      Container(
                        margin: FxSpacing.fromLTRB(20, 0, 20, 0),
                        child: singleRequest(
                            option: "Accept",
                            image: './assets/images/profile/avatar_5.jpg',
                            name: "Farrah Smyth",
                            status: "1 Friend Mutual"),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(20, 20, 20, 0),
                child: FxText.caption("SETTING",
                    fontWeight: 600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: FxSpacing.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/profile/avatar_2.jpg'),
                          width: 52,
                          height: 52,
                        ),
                      ),
                    ),
                    Container(
                      margin: FxSpacing.left(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b1("Rami Wheatley",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          FxText.b2("I'm using FlutKit",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        MdiIcons.accountOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.sh2("Account",
                              fontWeight: 600,
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground),
                          FxText.caption("Privacy, security, change number",
                              fontWeight: 500,
                              letterSpacing: 0,
                              muted: true,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.messageTextOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.sh2("Chats",
                              fontWeight: 600,
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground),
                          FxText.caption("Theme, wallpapers, chat history",
                              fontWeight: 500,
                              letterSpacing: 0,
                              muted: true,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.bellOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.sh2("Notifications",
                              fontWeight: 600,
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground),
                          FxText.caption("Message, group, call tones",
                              fontWeight: 500,
                              letterSpacing: 0,
                              muted: true,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.helpCircleOutline,
                        color: theme.colorScheme.onBackground,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.sh2("Help",
                              fontWeight: 600,
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground),
                          FxText.caption("FAQ, contact us",
                              fontWeight: 500,
                              letterSpacing: 0,
                              muted: true,
                              color: theme.colorScheme.onBackground),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        MdiIcons.logoutVariant,
                        color: theme.colorScheme.onBackground,
                      ),
                      title: FxText.sh2("Logout",
                          fontWeight: 600,
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget singleRequest(
      {required String image,
      required String name,
      required String status,
      required String option}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: customTheme.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      padding: FxSpacing.all(20),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              child: Image(
                image: AssetImage(image),
                height: 52,
                width: 52,
              )),
          Container(
            margin: FxSpacing.top(8),
            child: FxText.b2(name,
                color: theme.colorScheme.onBackground, fontWeight: 600),
          ),
          FxText.caption(status,
              color: theme.colorScheme.onBackground,
              fontWeight: 500,
              muted: true),
          Container(
            padding: FxSpacing.fromLTRB(10, 6, 10, 6),
            margin: FxSpacing.top(8),
            decoration: BoxDecoration(
                border: Border.all(color: customTheme.border, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: FxText.b2(option,
                color: theme.colorScheme.onBackground, fontWeight: 500),
          )
        ],
      ),
    );
  }
}
