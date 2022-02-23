import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/theme/app_notifier.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:provider/provider.dart';

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
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    FxControllerStore.resetStore();
    controller = FxControllerStore.putOrFind(SplashController());
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FxContainer(
                          margin: FxSpacing.x(20),
                          color: mTheme.primaryContainer,
                          borderRadiusAll: mTheme.containerRadius.medium,
                          child: Image(
                            image: AssetImage(Images.learningSplash),
                          ),
                        ),
                        FxSpacing.height(48),
                        FxText.h1('Nourish your \ninner skills',
                            fontWeight: 700, textAlign: TextAlign.center),
                        FxSpacing.height(20),
                        FxText.b2(
                          'Choose your favorite course and start learning.',
                          xMuted: true,
                          textAlign: TextAlign.center,
                        ),
                        FxSpacing.height(20),
                        Container(
                          margin: FxSpacing.x(20),
                          child: FxButton.block(
                            onPressed: () {
                              controller.goToLogInScreen();
                            },
                            backgroundColor: mTheme.primary,
                            splashColor: mTheme.onPrimary.withAlpha(30),
                            elevation: 0,
                            borderRadiusAll: mTheme.buttonRadius.large,
                            child: FxText.l1(
                              'Get Started',
                              color: mTheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }));
    });
  }
}
