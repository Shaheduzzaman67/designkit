import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/single_estate_controller.dart';
import '../models/house.dart';
import 'package:flutter/material.dart';

class SingleEstateScreen extends StatefulWidget {
  final House house;

  const SingleEstateScreen(this.house);

  @override
  _SingleEstateScreenState createState() => _SingleEstateScreenState();
}

class _SingleEstateScreenState extends State<SingleEstateScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late SingleEstateController controller;

  @override
  void initState() {
    super.initState();
    controller =
        FxControllerStore.putOrFind(SingleEstateController(widget.house));
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleEstateController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: Padding(
                padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: mTheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
            theme,
            mTheme,
          ));
    } else {
      return Container(
        padding: FxSpacing.fromLTRB(24, 8, 24, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FxContainer(
                    paddingAll: 4,
                    color: mTheme.primaryContainer,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: mTheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: FxText.b1(
                    'Details',
                    fontWeight: 700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: FxSpacing.y(16),
                children: [
                  FxContainer(
                    paddingAll: 0,
                    borderRadiusAll: mTheme.containerRadius.large,
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.house.image),
                    ),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    onTap: () {
                      controller.goToSingleAgentScreen(controller.house.agent);
                    },
                    color: mTheme.primaryContainer,
                    paddingAll: 8,
                    borderRadiusAll: mTheme.containerRadius.medium,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxContainer(
                          paddingAll: 0,
                          borderRadiusAll: mTheme.containerRadius.medium,
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            height: 52,
                            fit: BoxFit.cover,
                            image: AssetImage(controller.house.agent.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FxText.b2(
                              controller.house.agent.name,
                              fontWeight: 700,
                              color: mTheme.onPrimaryContainer,
                            ),
                            FxSpacing.height(8),
                            FxText.b3(
                              'View Agent Profile',
                              xMuted: true,
                              color: mTheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                        FxSpacing.width(60),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: mTheme.onPrimaryContainer,
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(16),
                  FxContainer(
                    paddingAll: 16,
                    borderRadiusAll: mTheme.containerRadius.medium,
                    color: mTheme.primaryContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FxText.b1(
                              controller.house.name,
                              fontWeight: 700,
                              color: mTheme.onPrimaryContainer,
                            ),
                            FxText.b2(
                              "\$" +
                                  controller.house.price.toString() +
                                  '/month',
                              fontWeight: 600,
                              color: mTheme.secondary,
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: mTheme.onPrimaryContainer,
                            ),
                            FxSpacing.width(4),
                            FxText.b3(
                              controller.house.location,
                              xMuted: true,
                              color: mTheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.king_bed,
                                    size: 16,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.b3(
                                    controller.house.bedrooms.toString() +
                                        ' Beds',
                                    xMuted: true,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bathtub,
                                    size: 16,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.b3(
                                    controller.house.bathrooms.toString() +
                                        ' Baths',
                                    xMuted: true,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FxSpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.square_foot,
                                    size: 16,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.b3(
                                    controller.house.floors.toString() +
                                        ' Floors',
                                    xMuted: true,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.aspect_ratio,
                                    size: 16,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                  FxSpacing.width(4),
                                  FxText.b3(
                                    controller.house.area.toString() + ' sqft',
                                    xMuted: true,
                                    height: 1,
                                    color: mTheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        FxSpacing.height(20),
                        FxText.b1(
                          'Description',
                          fontWeight: 700,
                          color: mTheme.onPrimaryContainer,
                        ),
                        FxSpacing.height(8),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: controller.house.description,
                                style: FxTextStyle.b2(
                                  color: mTheme.onPrimaryContainer,
                                  xMuted: true,
                                  height: 1.5,
                                )),
                            TextSpan(
                              text: "Read more",
                              style: FxTextStyle.b2(
                                color: mTheme.secondary,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            FxButton.block(
              onPressed: () {},
              child: FxText.b2(
                'Rent Now',
                color: mTheme.onPrimary,
                fontWeight: 700,
              ),
              backgroundColor: mTheme.primary,
              borderRadiusAll: mTheme.containerRadius.large,
              elevation: 0,
            ),
            FxSpacing.height(16),
          ],
        ),
      );
    }
  }
}
