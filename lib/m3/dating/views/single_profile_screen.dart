import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_profile_controller.dart';
import '../models/profile.dart';

class SingleProfileScreen extends StatefulWidget {
  final Profile profile;

  const SingleProfileScreen(this.profile, {Key? key}) : super(key: key);

  @override
  _SingleProfileScreenState createState() => _SingleProfileScreenState();
}

class _SingleProfileScreenState extends State<SingleProfileScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late SingleProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind<SingleProfileController>(
        SingleProfileController(widget.profile));
    theme = AppTheme.theme;
    mTheme = MaterialTheme.datingTheme;
  }

  List<Widget> _buildInterestList() {
    List<Widget> list = [];

    for (String interest in controller.profile.interests) {
      list.add(FxContainer.bordered(
        child: FxText.b3(
          interest,
          color: mTheme.primary,
        ),
        padding: FxSpacing.xy(8, 4),
        borderRadiusAll: mTheme.containerRadius.small,
        border: Border.all(color: mTheme.primary),
        color: mTheme.primaryContainer,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleProfileController>(
        controller: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: FxSpacing.top(24),
              child: LoadingEffect.getProductLoadingScreen(
                context,
                theme,
                mTheme,
              )));
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(
              20, FxSpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxContainer.bordered(
                  onTap: () {
                    controller.goBack();
                  },
                  paddingAll: 8,
                  borderRadiusAll: mTheme.containerRadius.small,
                  border: Border.all(color: mTheme.primary),
                  color: mTheme.primaryContainer,
                  child: Icon(
                    FeatherIcons.chevronLeft,
                    size: 20,
                    color: mTheme.primary,
                  ),
                ),
                FxContainer.bordered(
                  onTap: () {
                    controller.goToSingleChatScreen();
                  },
                  paddingAll: 8,
                  borderRadiusAll: mTheme.containerRadius.small,
                  border: Border.all(color: mTheme.primary),
                  color: mTheme.primaryContainer,
                  child: Icon(
                    FeatherIcons.messageCircle,
                    size: 20,
                    color: mTheme.primary,
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            FxContainer(
              height: 400,
              paddingAll: 0,
              borderRadiusAll: mTheme.containerRadius.large,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(controller.profile.image),
              ),
            ),
            FxSpacing.height(16),
            Row(
              children: [
                Expanded(
                  child: FxText.t2(
                    controller.profile.name,
                    fontWeight: 700,
                  ),
                ),
                FxSpacing.width(16),
                Icon(
                  FeatherIcons.instagram,
                  size: 20,
                  color: mTheme.primary,
                ),
                FxSpacing.width(12),
                Icon(
                  FeatherIcons.facebook,
                  size: 20,
                  color: mTheme.primary,
                ),
                FxSpacing.width(2),
              ],
            ),
            FxSpacing.height(4),
            FxText.b2(
              controller.profile.profession +
                  ', ' +
                  controller.profile.companyName,
              xMuted: true,
            ),
            FxSpacing.height(16),
            FxText.t2(
              'About',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            FxSpacing.height(8),
            FxText.b3(
              controller.profile.description,
              xMuted: true,
            ),
            FxSpacing.height(16),
            FxText.t3(
              'Interest',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            FxSpacing.height(16),
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: _buildInterestList(),
            ),
          ],
        ),
      );
    }
  }
}
