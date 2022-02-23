import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/profile_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import 'splash_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late ProfileController controller;

  bool notification = true, offlineReading = false;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: FxSpacing.top(FxSpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context, theme, mTheme),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            FxContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(controller.user.image),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  FxSpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b1(controller.user.name, fontWeight: 700),
                        FxSpacing.width(8),
                        FxText.b2(
                          controller.user.email,
                        ),
                        FxSpacing.height(8),
                        FxButton.outlined(
                            onPressed: () {},
                            splashColor: mTheme.primaryContainer,
                            borderColor: mTheme.primary,
                            padding: FxSpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: FxText.b3("Edit profile",
                                color: mTheme.primary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(24),
            FxContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.t2(
                  "Option",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: mTheme.primary.withAlpha(100),
                  activeTrackColor: mTheme.primary.withAlpha(150),
                  activeColor: mTheme.primary,
                  title: FxText.b2(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      notification = value;
                    });
                  },
                  value: notification,
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Language",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor: mTheme.primary.withAlpha(100),
                  activeTrackColor: mTheme.primary.withAlpha(150),
                  activeColor: mTheme.primary,
                  title: FxText.b2(
                    "Offline Reading",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      offlineReading = value;
                    });
                  },
                  value: offlineReading,
                ),
                Divider(
                  thickness: 0.8,
                ),
                FxSpacing.height(8),
                FxText.t2(
                  "Account",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Personal Information",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Country",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Favorite Recipes",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                FxSpacing.height(16),
                Center(
                    child: FxButton.rounded(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  child: FxText.l1(
                    "LOGOUT",
                    color: mTheme.onPrimary,
                  ),
                  elevation: 0,
                  borderRadiusAll: mTheme.buttonRadius.large,
                  splashColor: mTheme.onPrimary.withAlpha(30),
                  backgroundColor: mTheme.primary,
                ))
              ],
            )),
            FxSpacing.height(24),
            FxContainer(
                color: mTheme.primaryContainer,
                padding: FxSpacing.xy(16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FxTwoToneIcon(
                      FxTwoToneMdiIcons.headset_mic,
                      size: 32,
                      color: mTheme.primary,
                    ),
                    FxSpacing.width(12),
                    FxText.b3(
                      "Feel Free to Ask, We Ready to Help",
                      color: mTheme.primary,
                      letterSpacing: 0,
                    )
                  ],
                ))
          ],
        ),
      );
    }
  }
}
