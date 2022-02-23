import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/extensions/extensions.dart';
import 'package:flutkit/theme/app_theme.dart';

import '../controllers/subscription_controller.dart';
import '../models/pricing.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late SubscriptionController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.learningTheme;
    controller = FxControllerStore.putOrFind(SubscriptionController());
  }

  Widget _buildSinglePlan(Pricing pricing) {
    bool selected = controller.selectedPlan == pricing;
    return FxContainer.bordered(
      onTap: () {
        controller.onSelectPlan(pricing);
      },
      paddingAll: 16,
      margin: FxSpacing.bottom(20),
      border: Border.all(color: selected ? mTheme.primary : Colors.transparent),
      color: mTheme.primaryContainer,
      borderRadiusAll: mTheme.containerRadius.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxText.b2(
            pricing.name,
            color: mTheme.primary,
            fontWeight: selected ? 700 : 500,
            letterSpacing: 0.3,
          ),
          FxSpacing.height(8),
          Row(
            children: [
              FxText.h3(
                '\$ ' + pricing.price.toString(),
                fontWeight: selected ? 700 : 500,
              ),
              FxText.b2(
                ' /Month ',
                muted: true,
                letterSpacing: 0,
                fontWeight: selected ? 700 : 500,
                color: selected ? mTheme.primary : null,
              ),
            ],
          ),
          FxSpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.b3(
                pricing.description,
                color: selected ? mTheme.primary : null,
              ),
              FxContainer.bordered(
                borderRadiusAll: mTheme.buttonRadius.large,
                border: Border.all(color: mTheme.primary),
                color: selected ? mTheme.primary : mTheme.primaryContainer,
                padding: FxSpacing.xy(32, 10),
                child: FxText.l1(
                  'Buy',
                  color: selected ? mTheme.onPrimary : mTheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SubscriptionController>(
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
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
        ),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 0, 20, 20),
          children: [
            FxText.t1(
              'Pricing',
              fontWeight: 700,
              color: mTheme.primary,
            ),
            FxText.b3(
              'Select a suitable plan',
              muted: true,
              color: mTheme.primary,
            ),
            FxSpacing.height(20),
            ...controller.pricingPlans!
                .map((pricing) => _buildSinglePlan(pricing))
                .toList(),
          ],
        ),
      );
    }
  }
}
