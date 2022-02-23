import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/home_controller.dart';
import '../models/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<HomeController>(HomeController());
    theme = AppTheme.theme;
    mTheme = MaterialTheme.datingTheme;
  }

  List<Widget> _buildProfileList() {
    List<Widget> list = [];

    for (Profile profile in controller.profiles!) {
      list.add(_buildSingleProfile(profile));
    }
    return list;
  }

  Widget _buildSingleProfile(Profile profile) {
    return FxContainer(
      onTap: () {
        controller.goToSingleProfileScreen(profile);
      },
      paddingAll: 0,
      borderRadiusAll: mTheme.containerRadius.large,
      margin: FxSpacing.x(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(profile.image),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: FxSpacing.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(160),
                      Colors.black.withAlpha(120),
                      Colors.black.withAlpha(80),
                      Colors.transparent
                    ],
                    stops: [
                      0.1,
                      0.25,
                      0.5,
                      0.7,
                      1
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FeatherIcons.instagram,
                      size: 16,
                    ),
                    FxSpacing.width(8),
                    Icon(
                      FeatherIcons.facebook,
                      size: 16,
                    ),
                  ],
                ),
                FxSpacing.height(16),
                FxText.t1(
                  profile.name + ', ' + profile.age.toString(),
                  fontWeight: 600,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
                FxSpacing.height(4),
                FxText.b2(
                  profile.profession + ', ' + profile.companyName,
                  color: Colors.white,
                  xMuted: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: FxSpacing.top(24),
              child: LoadingEffect.getDatingHomeScreen(
                context,
                theme,
                mTheme,
              )));
    } else {
      return Scaffold(
        body: Padding(
          padding:
              FxSpacing.fromLTRB(0, FxSpacing.safeAreaTop(context) + 20, 0, 24),
          child: Column(
            children: [
              Padding(
                padding: FxSpacing.x(20),
                child: Row(
                  children: [
                    Expanded(
                      child: FxContainer(
                        padding: FxSpacing.xy(16, 12),
                        borderRadiusAll: mTheme.containerRadius.medium,
                        onTap: () {
                          controller.goToProfileScreen();
                        },
                        color: mTheme.primaryContainer,
                        child: Row(
                          children: [
                            FxContainer.rounded(
                              child: Icon(
                                Icons.bolt,
                                size: 16,
                                color: mTheme.onPrimary,
                              ),
                              paddingAll: 4,
                              color: mTheme.primary,
                            ),
                            FxSpacing.width(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.b3(
                                    'Upgrade to Premium',
                                    fontWeight: 700,
                                  ),
                                  FxSpacing.height(2),
                                  FxText.b3(
                                    'Your date is waiting!',
                                    xMuted: true,
                                    fontSize: 10,
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                            ),
                            FxSpacing.width(16),
                            FxContainer(
                              child: Icon(
                                FeatherIcons.settings,
                                color: mTheme.primary,
                                size: 16,
                              ),
                              border: Border.all(color: mTheme.primary),
                              paddingAll: 8,
                              borderRadiusAll: 8,
                              color: mTheme.primaryContainer,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(20),
              Expanded(
                child: PageView(
                  allowImplicitScrolling: true,
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (int page) {
                    controller.onPageChanged(page);
                  },
                  children: _buildProfileList(),
                ),
              ),
              FxSpacing.height(20),
              Container(
                height: 80,
                padding: FxSpacing.x(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FxContainer.rounded(
                        onTap: () {
                          controller.nextPage();
                        },
                        paddingAll: 12,
                        child: Icon(
                          FeatherIcons.x,
                          color: mTheme.secondary,
                        ),
                        color: mTheme.secondaryContainer,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: FxContainer.rounded(
                        onTap: () {
                          controller.goToMatchedProfileScreen();
                        },
                        paddingAll: 16,
                        color: mTheme.primary,
                        child: Icon(
                          FeatherIcons.heart,
                          color: mTheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FxContainer.roundBordered(
                        onTap: () {
                          controller.goToSingleChatScreen();
                        },
                        paddingAll: 12,
                        border: Border.all(color: mTheme.primary),
                        color: mTheme.primaryContainer,
                        child: Icon(
                          FeatherIcons.messageCircle,
                          color: mTheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
