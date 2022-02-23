import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

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
  initState() {
    super.initState();

    FxControllerStore.resetStore();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;

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
          builder: (controller) {
            return Scaffold(
              body: Stack(
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/apps/estate/estate16.jpg"),
                  ),
                  Positioned(
                    top: 132,
                    left: 0,
                    right: 0,
                    child: FxText.h3(
                      'Let\'s Find Your',
                      color: mTheme.onPrimary,
                      textAlign: TextAlign.center,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: FxText.d3(
                      'Dream Home',
                      color: mTheme.onPrimary,
                      textAlign: TextAlign.center,
                      fontWeight: 800,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: FxContainer(
                      onTap: () {
                        controller.goToSearchScreen();
                      },
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(mTheme.containerRadius.large),
                          topRight:
                              Radius.circular(mTheme.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      paddingAll: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.b2(
                            'Search by location...',
                            fontWeight: 700,
                            color: mTheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    child: FxCard(
                      onTap: () {
                        controller.goToLogin();
                      },
                      paddingAll: 24,
                      color: mTheme.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(mTheme.containerRadius.large),
                          bottomRight:
                              Radius.circular(mTheme.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FxText.b2(
                            'Join Now',
                            fontWeight: 700,
                            color: mTheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
