import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/single_agent_controller.dart';
import '../models/agent.dart';
import '../models/house.dart';

class SingleAgentScreen extends StatefulWidget {
  final Agent agent;

  const SingleAgentScreen(this.agent);

  @override
  _SingleAgentScreenState createState() => _SingleAgentScreenState();
}

class _SingleAgentScreenState extends State<SingleAgentScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late SingleAgentController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
    controller =
        FxControllerStore.putOrFind(SingleAgentController(widget.agent));
  }

  Widget _buildSingleHouse(House house) {
    return FxContainer(
      onTap: () {
        controller.goToSingleHouseScreen(house);
      },
      margin: FxSpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: mTheme.containerRadius.medium,
      color: mTheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FxContainer(
            paddingAll: 0,
            borderRadiusAll: mTheme.containerRadius.medium,
            clipBehavior: Clip.hardEdge,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(house.image),
            ),
          ),
          FxSpacing.height(8),
          FxText.b1(
            house.name,
            fontWeight: 700,
            color: mTheme.onSecondaryContainer,
          ),
          FxSpacing.height(4),
          FxText.b3(
            house.location,
            xMuted: true,
            color: mTheme.onSecondaryContainer,
          ),
          FxSpacing.height(4),
          FxText.b3(
            house.price.toString(),
            color: mTheme.onSecondaryContainer,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in controller.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SingleAgentController>(
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
      return ListView(
        padding: FxSpacing.fromLTRB(0, 8, 0, 20),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
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
                FxSpacing.width(64),
                FxText.b1(
                  'Agent Profile',
                  fontWeight: 700,
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: FxContainer(
              paddingAll: 12,
              borderRadiusAll: mTheme.containerRadius.large,
              color: mTheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FxContainer(
                        paddingAll: 0,
                        borderRadiusAll: mTheme.containerRadius.medium,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(controller.agent.image),
                        ),
                      ),
                      FxSpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FxText.b1(
                            controller.agent.name,
                            fontWeight: 700,
                            color: mTheme.onPrimaryContainer,
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
                                controller.agent.address,
                                xMuted: true,
                                color: mTheme.onPrimaryContainer,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.b2(
                    'Information',
                    fontWeight: 700,
                    color: mTheme.onPrimaryContainer,
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: mTheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: mTheme.primary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.b3(
                        controller.agent.number,
                        color: mTheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  FxSpacing.height(8),
                  Row(
                    children: [
                      FxContainer.rounded(
                          paddingAll: 4,
                          color: mTheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: mTheme.primary,
                            size: 14,
                          )),
                      FxSpacing.width(12),
                      FxText.b3(
                        controller.agent.properties,
                        color: mTheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  FxSpacing.height(16),
                  FxText.b2(
                    'About Me',
                    fontWeight: 700,
                    color: mTheme.onPrimaryContainer,
                  ),
                  FxSpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: controller.agent.description,
                          style: FxTextStyle.b3(
                            color: mTheme.onPrimaryContainer,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: FxTextStyle.b3(
                          color: mTheme.secondary,
                        ),
                      ),
                    ]),
                  ),
                  FxSpacing.height(16),
                  FxButton.block(
                    padding: FxSpacing.symmetric(horizontal: 24, vertical: 16),
                    onPressed: () {},
                    child: FxText.b2(
                      'Ask A Question',
                      color: mTheme.onPrimary,
                      fontWeight: 700,
                    ),
                    backgroundColor: mTheme.primary,
                    borderRadiusAll: mTheme.containerRadius.large,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          FxSpacing.height(16),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b2(
                  'Agent Listings',
                  fontWeight: 700,
                ),
                FxText.b3(
                  'See All',
                  xMuted: true,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildHouseList(),
            ),
          ),
        ],
      );
    }
  }
}
