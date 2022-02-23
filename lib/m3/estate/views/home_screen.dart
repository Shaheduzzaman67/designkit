import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/home_controller.dart';
import '../models/category.dart';
import '../models/house.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(HomeController());
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
  }

  List<Widget> _buildCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (Category category in controller.categories!) {
      list.add(_buildSingleCategory(category));
    }
    return list;
  }

  List<Widget> _buildFilterCategoryList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));
    for (Category category in controller.categories!) {
      list.add(_buildFilterCategory(category));
    }
    return list;
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(FxSpacing.width(24));

    for (House house in controller.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  Widget _buildSingleCategory(Category category) {
    return Container(
      margin: FxSpacing.right(16),
      child: Column(
        children: [
          FxContainer.rounded(
            color: mTheme.primaryContainer,
            child: Icon(
              category.categoryIcon,
              color: mTheme.primary,
            ),
          ),
          FxSpacing.height(8),
          FxText.b3(
            category.category,
            xMuted: true,
            fontSize: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCategory(Category category) {
    return FxContainer.bordered(
      paddingAll: 8,
      borderRadiusAll: mTheme.containerRadius.small,
      margin: FxSpacing.right(8),
      border: Border.all(color: mTheme.primary, width: 1),
      splashColor: mTheme.primaryContainer,
      color: mTheme.primaryContainer,
      child: Row(
        children: [
          Icon(
            category.categoryIcon,
            color: mTheme.primary,
            size: 16,
          ),
          FxSpacing.width(8),
          FxText.b3(
            category.category,
            fontWeight: 600,
            color: mTheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }

  Widget _buildSingleHouse(House house) {
    return FxContainer(
      onTap: () {
        controller.goToSingleHouseScreen(house);
      },
      margin: FxSpacing.nTop(24),
      paddingAll: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadiusAll: mTheme.containerRadius.medium,
      child: Column(
        children: [
          Image(
            image: AssetImage(house.image),
            fit: BoxFit.fitWidth,
          ),
          FxContainer(
            paddingAll: 16,
            color: mTheme.primaryContainer,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(mTheme.containerRadius.medium),
                bottomRight: Radius.circular(mTheme.containerRadius.medium)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.b1(
                      house.name,
                      fontWeight: 700,
                      color: mTheme.onPrimaryContainer,
                    ),
                    FxText.b2(
                      "\$" + house.price.toString() + '/month',
                      fontWeight: 600,
                      color: mTheme.secondary,
                    ),
                  ],
                ),
                FxSpacing.height(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: mTheme.onPrimaryContainer,
                    ),
                    FxSpacing.width(4),
                    FxText.b3(house.location,
                        xMuted: true, color: mTheme.onPrimaryContainer),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            house.bedrooms.toString() + ' Beds',
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
                            house.bathrooms.toString() + ' Baths',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            house.floors.toString() + ' Floors',
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
                            house.area.toString() + ' sqft',
                            xMuted: true,
                            color: mTheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: mTheme.primaryContainer)),
            child: Scaffold(
              body: Container(
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
          child: LoadingEffect.getSearchLoadingScreen(
        context,
        theme,
        mTheme,
      ));
    } else {
      return ListView(
        padding: FxSpacing.top(20),
        children: [
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.b3(
                      'Location',
                      xMuted: true,
                    ),
                    FxSpacing.height(2),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: mTheme.primary,
                          size: 14,
                        ),
                        FxSpacing.width(4),
                        FxText.b2(
                          'San Jose, CA',
                          fontWeight: 600,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: mTheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
                FxContainer(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  color: mTheme.secondaryContainer,
                  paddingAll: 6,
                  child: Icon(
                    Icons.more_horiz_outlined,
                    color: mTheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCategoryList(),
            ),
          ),
          FxSpacing.height(24),
          Padding(
            padding: FxSpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.b1(
                  'Recommended',
                  fontWeight: 600,
                ),
                FxText.b3(
                  'More',
                  xMuted: true,
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          Column(
            children: _buildHouseList(),
          ),
        ],
      );
    }
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return FxContainer(
                padding: FxSpacing.top(24),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxContainer.rounded(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            paddingAll: 6,
                            color: mTheme.secondary,
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: mTheme.secondaryContainer,
                            ),
                          ),
                          FxText.b2(
                            'Filters',
                            fontWeight: 600,
                          ),
                          FxText.b3(
                            'Reset',
                            color: mTheme.primary,
                          ),
                        ],
                      ),
                    ),
                    FxSpacing.height(8),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Category',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _buildFilterCategoryList(),
                      ),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Price Range ( ' +
                            '${controller.selectedRange.start.toInt().toString()} - ' +
                            '${controller.selectedRange.end.toInt().toString()} )',
                        fontWeight: 700,
                      ),
                    ),
                    RangeSlider(
                        activeColor: mTheme.primary,
                        inactiveColor: mTheme.primary.withAlpha(100),
                        max: 10000,
                        min: 0,
                        values: controller.selectedRange,
                        onChanged: (RangeValues newRange) {
                          setState(() => controller.selectedRange = newRange);
                        }),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Bed Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (controller.selectedBedRooms
                                    .contains(element)) {
                                  controller.selectedBedRooms.remove(element);
                                } else {
                                  controller.selectedBedRooms.add(element);
                                }
                              });
                            },
                            child: SingleBed(
                              bed: element,
                              selected:
                                  controller.selectedBedRooms.contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxText.b2(
                        'Bath Rooms',
                        fontWeight: 700,
                      ),
                    ),
                    FxSpacing.height(8),
                    SingleChildScrollView(
                      padding: FxSpacing.x(24),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              ['Any', '1', '2', '3', '4', '5'].map((element) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (controller.selectedBathRooms
                                    .contains(element)) {
                                  controller.selectedBathRooms.remove(element);
                                } else {
                                  controller.selectedBathRooms.add(element);
                                }
                              });
                            },
                            child: SingleBath(
                              bath: element,
                              selected: controller.selectedBathRooms
                                  .contains(element),
                            ));
                      }).toList()),
                    ),
                    FxSpacing.height(16),
                    Padding(
                      padding: FxSpacing.horizontal(24),
                      child: FxButton.block(
                        borderRadiusAll: 8,
                        elevation: 0,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: mTheme.primary,
                        child: FxText.t3(
                          "Apply Filters",
                          fontWeight: 700,
                          color: mTheme.onPrimary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                    FxSpacing.height(16),
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleBed extends StatefulWidget {
  final String bed;
  final bool selected;

  const SingleBed({Key? key, required this.bed, required this.selected})
      : super(key: key);

  @override
  _SingleBedState createState() => _SingleBedState();
}

class _SingleBedState extends State<SingleBed> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return FxContainer(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(color: selected ? mTheme.primary : mTheme.primary),
      splashColor: mTheme.primaryContainer,
      color: selected ? mTheme.primary : mTheme.primaryContainer,
      child: FxText.b3(
        widget.bed,
        fontWeight: 600,
        color: selected ? mTheme.onPrimary : mTheme.onPrimaryContainer,
      ),
    );
  }
}

class SingleBath extends StatefulWidget {
  final String bath;
  final bool selected;

  const SingleBath({Key? key, required this.bath, required this.selected})
      : super(key: key);

  @override
  _SingleBathState createState() => _SingleBathState();
}

class _SingleBathState extends State<SingleBath> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    bool selected = widget.selected;

    return FxContainer(
      padding: FxSpacing.symmetric(horizontal: 16, vertical: 8),
      borderRadiusAll: 8,
      margin: FxSpacing.right(12),
      bordered: true,
      border: Border.all(color: selected ? mTheme.primary : mTheme.primary),
      splashColor: mTheme.primaryContainer,
      color: selected ? mTheme.primary : mTheme.primaryContainer,
      child: FxText.b3(
        widget.bath,
        fontWeight: 600,
        color: selected ? mTheme.onPrimary : mTheme.onPrimaryContainer,
      ),
    );
  }
}
