import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import 'chat_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class FullAppScreen extends StatefulWidget {
  const FullAppScreen({Key? key}) : super(key: key);

  @override
  _FullAppScreenState createState() => _FullAppScreenState();
}

class _FullAppScreenState extends State<FullAppScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
    FxTextStyle.changeFontFamily(GoogleFonts.quicksand);
    FxTextStyle.changeDefaultFontWeight({
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: mTheme.primaryContainer)),
      child: Scaffold(
        body: FxBottomNavigationBar(
          activeTitleColor: mTheme.primary,
          activeContainerColor: mTheme.primary.withAlpha(80),
          fxBottomNavigationBarType: FxBottomNavigationBarType.containered,
          containerShape: BoxShape.rectangle,
          containerRadius: mTheme.containerRadius.small,
          showActiveLabel: false,
          showLabel: false,
          activeIconColor: mTheme.primary,
          iconColor: mTheme.onPrimaryContainer.withAlpha(120),
          backgroundColor: mTheme.primaryContainer,
          itemList: [
            FxBottomNavigationBarItem(
              page: HomeScreen(),
              activeIconData: Icons.other_houses,
              iconData: Icons.other_houses_outlined,
              activeIconSize: 24,
              iconSize: 24,
            ),
            FxBottomNavigationBarItem(
              page: SearchScreen(),
              activeIconData: Icons.search,
              iconData: Icons.search,
              activeIconSize: 24,
              iconSize: 24,
            ),
            FxBottomNavigationBarItem(
                page: ChatScreen(),
                activeIconData: Icons.chat,
                iconData: Icons.chat_outlined,
                activeIconSize: 22,
                iconSize: 24),
            FxBottomNavigationBarItem(
              page: ProfileScreen(),
              activeIconData: Icons.person,
              iconData: Icons.person_outline,
              activeIconSize: 24,
              iconSize: 24,
            ),
          ],
        ),
      ),
    );
  }
}
