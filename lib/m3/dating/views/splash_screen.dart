import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../../../theme/app_theme.dart';
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
    FxControllerStore.resetStore();
    mTheme = MaterialTheme.datingTheme;

    controller =
        FxControllerStore.putOrFind<SplashController>(SplashController());
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SplashController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/apps/dating/splash.png'),
                  ),
                  FxText.d3(
                    'Find your \nBest matches',
                    fontWeight: 600,
                    textAlign: TextAlign.center,
                    fontSize: 28,
                    letterSpacing: 0,
                  ),
                  FxSpacing.height(32),
                  Container(
                    margin: FxSpacing.x(40),
                    child: FxButton.block(
                      onPressed: () {
                        controller.goToHomeScreen();
                      },
                      elevation: 0,
                      splashColor: mTheme.primaryContainer.withAlpha(30),
                      borderRadiusAll: mTheme.buttonRadius.large,
                      backgroundColor: mTheme.primary,
                      child: FxText.l1(
                        'Find Someone',
                        color: mTheme.onPrimary,
                        fontWeight: 600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
