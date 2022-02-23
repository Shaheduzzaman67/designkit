import 'package:flutkit/m3/cookify/controllers/full_app_controller.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutx/flutx.dart';
import 'home_screen.dart';
import 'meal_plan_screen.dart';
import 'profile_screen.dart';
import 'showcase_screen.dart';
import 'package:flutter/material.dart';

class FullApp extends StatefulWidget {
  @override
  _FullAppState createState() => _FullAppState();
}

class _FullAppState extends State<FullApp> {
  late MaterialThemeData mTheme;
  late FullAppController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(FullAppController());
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: mTheme.primaryContainer)),
      child: Scaffold(
        body: FxBottomNavigationBar(
          activeTitleStyle:
              FxTextStyle.b3(color: mTheme.primary, fontWeight: 800),
          activeContainerColor: mTheme.primary.withAlpha(120),
          containerShape: BoxShape.rectangle,
          fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
          containerRadius: mTheme.containerRadius.small,
          backgroundColor: mTheme.primaryContainer,
          showLabel: false,
          labelSpacing: 8,
          initialIndex: 0,
          labelDirection: Axis.horizontal,
          itemList: [
            FxBottomNavigationBarItem(
              page: HomeScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.home,
                color: mTheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.cottage,
                color: mTheme.primary,
                size: 24,
              ),
              title: "Home",
              activeIconColor: mTheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: ShowcaseScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.import_contacts,
                color: mTheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.menu_book,
                color: mTheme.primary,
                size: 24,
              ),
              title: "Explore",
              activeIconColor: mTheme.primary,
              activeTitleColor: mTheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: MealPlanScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.fastfood,
                color: mTheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.lunch_dining,
                color: mTheme.primary,
                size: 24,
              ),
              title: "Meal",
              activeIconColor: mTheme.primary,
              activeTitleColor: mTheme.primary,
            ),
            FxBottomNavigationBarItem(
              page: ProfileScreen(),
              icon: FxTwoToneIcon(
                FxTwoToneMdiIcons.person,
                color: mTheme.primary,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.person,
                color: mTheme.primary,
                size: 24,
              ),
              title: "Setting",
              activeIconColor: mTheme.primary,
              activeTitleColor: mTheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
