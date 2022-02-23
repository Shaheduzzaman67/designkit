import 'package:flutkit/m3/cookify/controllers/splash_controller.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.cookifyTheme;
    controller = FxControllerStore.putOrFind(SplashController());
    FxControllerStore.resetStore();
    FxTextStyle.changeFontFamily(GoogleFonts.mali);
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
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.copyWith(
              colorScheme: theme.colorScheme
                  .copyWith(secondary: mTheme.primaryContainer)),
          builder: (context, child) {
            return Directionality(
                textDirection: AppTheme.textDirection, child: child!);
          },
          home: FxBuilder<SplashController>(
              controller: controller,
              builder: (controller) {
                return Scaffold(
                  body: Container(
                    margin: FxSpacing.fromLTRB(24, 100, 24, 32),
                    child: Column(
                      children: [
                        FxText.h3(
                          "Welcome to Cookify",
                          color: mTheme.primary,
                        ),
                        Expanded(
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                  './assets/images/apps/cookify/splash-1.png'),
                              width: 320,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: FxButton.text(
                              splashColor: mTheme.primaryContainer,
                              padding: FxSpacing.y(12),
                              onPressed: () {
                                controller.goToRegisterScreen();
                              },
                              child: FxText.l1(
                                "SIGN UP",
                                color: mTheme.primary,
                                letterSpacing: 0.5,
                              ),
                            )),
                            Expanded(
                                child: FxButton(
                              elevation: 0,
                              padding: FxSpacing.y(12),
                              borderRadiusAll: mTheme.buttonRadius.large,
                              splashColor: mTheme.onPrimary.withAlpha(40),
                              onPressed: () {
                                controller.goToLogInScreen();
                              },
                              child: FxText.l1(
                                "LOG IN",
                                color: mTheme.onPrimary,
                                letterSpacing: 0.5,
                              ),
                              backgroundColor: mTheme.primary,
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
