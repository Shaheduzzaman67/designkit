import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
    FxTextStyle.changeFontFamily(GoogleFonts.k2d);
    FxControllerStore.resetStore();

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

    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
    controller = FxControllerStore.putOrFind(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: mTheme.primaryContainer)),
      debugShowCheckedModeBanner: false,
      home: FxBuilder<SplashController>(
          controller: controller,
          builder: (splashController) {
            return Scaffold(
              body: Stack(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: FxContainer.none(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      clipBehavior: Clip.hardEdge,
                      child: Image(
                        image: AssetImage(
                            'assets/images/apps/homemade/splash.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FxText.d3(
                        'Find your Products Inside',
                        fontWeight: 700,
                        color: mTheme.primary,
                        textAlign: TextAlign.center,
                      ),
                      FxSpacing.height(32),
                      Padding(
                        padding: FxSpacing.horizontal(80),
                        child: FxButton.block(
                          borderRadiusAll: mTheme.buttonRadius.large,
                          elevation: 0,
                          backgroundColor: mTheme.primary,
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: FxText.b1(
                            'Log In',
                            color: mTheme.onPrimary,
                            fontWeight: 700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      FxSpacing.height(24),
                      Padding(
                        padding: FxSpacing.horizontal(80),
                        child: FxButton.block(
                            borderRadiusAll: mTheme.buttonRadius.large,
                            elevation: 0,
                            backgroundColor: mTheme.secondary,
                            onPressed: () {
                              controller.goToRegister();
                            },
                            child: FxText.b1(
                              'Register',
                              color: mTheme.onSecondary,
                              fontWeight: 700,
                              letterSpacing: 0.5,
                            )),
                      ),
                      FxSpacing.height(40),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
