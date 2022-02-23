/*
* File : Basic Setting
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicSettingScreen extends StatefulWidget {
  @override
  _BasicSettingScreenState createState() => _BasicSettingScreenState();
}

class _BasicSettingScreenState extends State<BasicSettingScreen> {
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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: FxText.h6("Setting", fontWeight: 600),
        ),
        backgroundColor: theme.backgroundColor,
        body: ListView(
          padding: FxSpacing.nTop(20),
          children: <Widget>[
            TextFormField(
              style: FxTextStyle.b1(
                  letterSpacing: 0.1, color: theme.colorScheme.onBackground),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: FxTextStyle.sh2(
                    letterSpacing: 0.1, color: theme.colorScheme.onBackground),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: customTheme.card,
                prefixIcon: Icon(MdiIcons.magnify,
                    size: 22,
                    color: Theme.of(context).colorScheme.onBackground),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
            ),
            FxSpacing.height(12),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.accountEditOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("Account", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      MdiIcons.bellRingOutline,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("Notifications", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.eyeOutline,
                        size: 22, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("Appearance", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.lockOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("Privacy \& Security", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.faceAgent,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("Help \& Support", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.helpCircleOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.sh1("About", fontWeight: 600),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
          ],
        ));
  }
}
