import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/m3/cookify/controllers/meal_plan_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutx/flutx.dart';
import '../models/date_time.dart';
import '../models/meal_plan.dart';
import 'package:flutter/material.dart';

import 'recipe_screen.dart';

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late MealPlanController controller;

  @override
  void initState() {
    super.initState();
    mTheme = MaterialTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(MealPlanController());
    theme = AppTheme.theme;
  }

  List<Widget> buildDateTime() {
    List<Widget> list = [];

    for (int i = 0; i < controller.listDateTime.length; i++) {
      list.add(singleDateTime(i));
    }

    return list;
  }

  Widget singleDateTime(int index) {
    DateTime dateTime = controller.listDateTime[index];
    bool active = controller.selectedDate == index;

    return FxContainer.none(
      onTap: () {
        setState(() {
          controller.selectedDate = index;
        });
      },
      splashColor: mTheme.primaryContainer,
      width: 40,
      margin: FxSpacing.x(2),
      padding: FxSpacing.y(8),
      borderRadiusAll: 4,
      color: active ? mTheme.primary : Colors.transparent,
      child: Column(
        children: [
          FxText.b3(dateTime.date,
              color:
                  active ? mTheme.onPrimary : theme.colorScheme.onBackground),
          FxSpacing.height(8),
          FxText.b3(dateTime.day,
              color:
                  active ? mTheme.onPrimary : theme.colorScheme.onBackground),
        ],
      ),
    );
  }

  List<Widget> buildMealPlan() {
    List<Widget> list = [];

    for (MealPlan mealPlan in controller.listMealPlan) {
      list.add(singleMealPlan(mealPlan));
    }

    return list;
  }

  Widget singleMealPlan(MealPlan mealPlan) {
    return InkWell(
      child: FxContainer.none(
        splashColor: mTheme.primaryContainer,
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
        },
        color: Colors.transparent,
        margin: FxSpacing.bottom(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxText.b2(mealPlan.type, muted: true, letterSpacing: 0),
            FxSpacing.height(8),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(mealPlan.image),
                    height: 56,
                    width: 56,
                  ),
                ),
                FxSpacing.width(8),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.b2(mealPlan.title,
                        fontWeight: 700, letterSpacing: 0),
                    FxSpacing.height(8),
                    FxText.b3(mealPlan.time, muted: true, letterSpacing: 0),
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onBackground,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<MealPlanController>(
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
              FxText.h3("Today\'s Plan", fontWeight: 700, letterSpacing: -0.2),
              FxSpacing.height(16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildDateTime(),
                ),
              ),
              FxSpacing.height(24),
              FxContainer(
                color: mTheme.primaryContainer,
                child: Column(
                  children: [
                    Center(
                        child: FxText.t1(
                      "Vitamins & Minerals",
                      color: mTheme.primary,
                      fontWeight: 600,
                    )),
                    FxSpacing.height(4),
                    Center(
                        child: FxText.b3(
                      "How Much Should You Take?",
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                      letterSpacing: 0,
                    )),
                    FxSpacing.height(16),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              FxText.h1(
                                "80",
                                fontWeight: 800,
                                color: mTheme.primary,
                              ),
                              FxText.b3(
                                "Vitamin A",
                                xMuted: true,
                                letterSpacing: 0,
                                fontSize: 10,
                              )
                            ],
                          )),
                          VerticalDivider(
                            thickness: 1,
                            color: mTheme.primary.withAlpha(200),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              FxText.h1(
                                "16",
                                fontWeight: 800,
                                color: mTheme.primary,
                              ),
                              FxText.b3(
                                "Vitamin B",
                                fontSize: 10,
                                xMuted: true,
                                letterSpacing: 0,
                              )
                            ],
                          )),
                          VerticalDivider(
                            thickness: 1,
                            color: mTheme.primary.withAlpha(200),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                FxText.h1(
                                  "97",
                                  fontWeight: 800,
                                  color: mTheme.primary,
                                ),
                                FxText.b3(
                                  "Water",
                                  xMuted: true,
                                  letterSpacing: 0,
                                  fontSize: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FxSpacing.height(24),
              Column(
                children: buildMealPlan(),
              ),
            ]),
      );
    }
  }
}
