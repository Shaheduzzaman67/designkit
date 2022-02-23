import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/explore_controller.dart';
import '../models/mentor.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late ExploreController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(ExploreController());
  }

  Widget _buildMentors() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FxSpacing.width(8),
          ...controller.mentors!
              .map((mentor) => _buildSingleMentor(mentor))
              .toList(),
          FxSpacing.width(8),
        ],
      ),
    );
  }

  List<Widget> _buildCourseList() {
    List<Widget> list = [];

    for (String course in controller.courses) {
      list.add(_buildSingleCourse(course));
    }
    return list;
  }

  Widget _buildSingleMentor(Mentor mentor) {
    return Padding(
      padding: FxSpacing.x(8),
      child: Column(
        children: [
          FxContainer.rounded(
            paddingAll: 0,
            child: Image(
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              image: AssetImage(mentor.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.b3(
            mentor.name,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCourse(String course) {
    return FxContainer.bordered(
      onTap: () {
        controller.onTap(course);
      },
      borderRadiusAll: 20,
      border: controller.selectedCourses.contains(course)
          ? Border.all(color: mTheme.secondary)
          : Border.all(color: Colors.transparent),
      color: controller.selectedCourses.contains(course)
          ? mTheme.secondaryContainer
          : mTheme.primaryContainer,
      padding: FxSpacing.xy(12, 8),
      child: FxText.b3(
        course,
        fontWeight: controller.selectedCourses.contains(course) ? 600 : 500,
        color: controller.selectedCourses.contains(course)
            ? mTheme.secondary
            : theme.colorScheme.onBackground,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ExploreController>(
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
            FxContainer(
              margin: FxSpacing.x(20),
              padding: FxSpacing.y(6),
              color: mTheme.primaryContainer,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadiusAll: mTheme.containerRadius.large,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: theme.colorScheme.onBackground,
                        maxLines: 1,
                        style: FxTextStyle.b2(),
                        decoration: InputDecoration(
                          hintText: "Search ...",
                          hintStyle: FxTextStyle.b3(
                              color: theme.colorScheme.onBackground),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          isDense: true,
                          fillColor: mTheme.primaryContainer,
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                    FxSpacing.width(8),
                    Container(
                        padding: FxSpacing.y(4),
                        child: VerticalDivider(
                          thickness: 1.1,
                          color: mTheme.outline,
                        )),
                    FxSpacing.width(8),
                    Icon(
                      FeatherIcons.sliders,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                    FxSpacing.width(20),
                  ],
                ),
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l1(
                    'POPULAR MENTORS',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            _buildMentors(),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l1(
                    'COURSES',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            Container(
              padding: FxSpacing.x(20),
              child: Wrap(
                children: _buildCourseList(),
                runSpacing: 8,
                spacing: 8,
              ),
            ),
            FxSpacing.height(20),
            Padding(
              padding: FxSpacing.x(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FxText.l1(
                    'RESULT (5)',
                    fontWeight: 700,
                  ),
                  Icon(
                    FeatherIcons.moreHorizontal,
                  ),
                ],
              ),
            ),
            FxSpacing.height(20),
            ...controller.courseList!.map((course) {
              return Padding(
                padding: FxSpacing.nTop(20),
                child: Row(
                  children: [
                    FxContainer.rounded(
                      paddingAll: 12,
                      color: mTheme.primaryContainer,
                      child: Icon(
                        course.iconData,
                        color: mTheme.primary,
                        size: 22,
                      ),
                    ),
                    FxSpacing.width(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.l2(
                          course.lastChapter,
                          fontWeight: 700,
                        ),
                        FxSpacing.height(8),
                        FxText.b3(
                          course.name,
                          muted: true,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      );
    }
  }
}
