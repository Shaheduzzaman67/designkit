import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/localizations/language.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/home_controller.dart';
import '../models/course.dart';
import '../models/module.dart';
import '../models/recent_course.dart';

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
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(HomeController());
  }

  List<Widget> _buildCourseList() {
    List<Widget> list = [];

    for (Course course in controller.courses!) {
      list.add(Expanded(
        child: Column(
          children: [
            FxContainer.rounded(
              paddingAll: 12,
              color: mTheme.primaryContainer,
              child: Icon(
                course.iconData,
                color: mTheme.primary,
                size: 20,
              ),
            ),
            FxSpacing.height(8),
            FxText.l2(
              course.name,
            ),
          ],
        ),
      ));
    }

    return list;
  }

  List<Widget> _buildRecentCourseList() {
    List<Widget> list = [];

    for (RecentCourse recentCourse in controller.recentCourses!) {
      list.add(FxContainer(
        onTap: () {
          controller.goToSingleCourseScreen(recentCourse);
        },
        padding:
            FxSpacing.fromLTRB(12, 20, Language.autoDirection(16.0, 12.0)!, 20),
        margin: FxSpacing.nTop(20),
        borderRadiusAll: mTheme.containerRadius.medium,
        color: mTheme.primaryContainer,
        child: Row(
          children: [
            Image(
              image: AssetImage(recentCourse.icon),
              height: 40,
              width: 40,
              color: mTheme.primary,
            ),
            FxSpacing.width(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.l2(
                    recentCourse.name,
                    fontWeight: 700,
                  ),
                  FxSpacing.height(6),
                  FxText.l3(
                    recentCourse.time,
                    xMuted: true,
                    fontWeight: 600,
                  ),
                ],
              ),
            ),
            FxSpacing.width(8),
            Stack(
              children: [
                FxContainer.rounded(
                  paddingAll: 6,
                  color: mTheme.onPrimary,
                  child: Icon(
                    Icons.play_arrow,
                    color: mTheme.primary,
                  ),
                ),
                CircularProgressIndicator(
                  value: recentCourse.completed / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(mTheme.primary),
                  strokeWidth: 2,
                ),
              ],
            ),
          ],
        ),
      ));
    }

    return list;
  }

  Widget _buildModules() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FxSpacing.width(8),
          ...controller.modules!
              .map((module) => _buildSingleModule(module))
              .toList(),
          FxSpacing.width(8),
        ],
      ),
    );
  }

  Widget _buildSingleModule(Module module) {
    bool selected = controller.selectedModule == module;
    return FxContainer(
      bordered: true,
      margin: FxSpacing.x(8),
      width: 108,
      onTap: () {
        controller.onChangeSingleModule(module);
      },
      border:
          Border.all(color: selected ? mTheme.secondary : Colors.transparent),
      padding: FxSpacing.xy(20, 20),
      borderRadiusAll: mTheme.containerRadius.medium,
      color: mTheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            module.iconData,
            color: mTheme.secondary,
            size: 20,
          ),
          FxSpacing.height(20),
          FxText.l2(
            module.name,
            color: mTheme.onSecondaryContainer,
          ),
          FxSpacing.height(4),
          FxText.b3(
            module.chapter,
            muted: true,
            fontSize: 10,
            color: mTheme.onSecondaryContainer,
          ),
          FxSpacing.height(20),
          Row(
            children: [
              Icon(
                FeatherIcons.clock,
                size: 12,
                color: selected
                    ? mTheme.onSecondaryContainer
                    : mTheme.onSecondaryContainer.withAlpha(120),
              ),
              FxSpacing.width(8),
              FxText.b3(
                module.time,
                muted: selected ? true : false,
                fontSize: 10,
                color: mTheme.onSecondaryContainer,
              ),
            ],
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
        body: LoadingEffect.getSearchLoadingScreen(context, theme, mTheme),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.zero,
          children: [
            FxContainer.bordered(
              padding: FxSpacing.xy(32, 20),
              margin: FxSpacing.x(20),
              borderRadiusAll: mTheme.containerRadius.medium,
              onTap: () {
                controller.goToPricingScreen();
              },
              border: Border.all(color: mTheme.primary),
              color: mTheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l2(
                    'Upgrade your plan \nto Premium',
                    fontWeight: 700,
                    color: mTheme.primary,
                    letterSpacing: 0.5,
                    height: 1.4,
                  ),
                  FxContainer(
                    borderRadiusAll: mTheme.buttonRadius.large,
                    padding: FxSpacing.xy(20, 10),
                    color: mTheme.primary,
                    child: FxText.l2(
                      'Upgrade',
                      color: mTheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l2(
                    'POPULAR COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                children: _buildCourseList(),
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l2(
                    'CONTINUE LEARNING',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            _buildModules(),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l2(
                    'LAST SEEN COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Column(
              children: _buildRecentCourseList(),
            ),
          ],
        ),
      );
    }
  }
}
