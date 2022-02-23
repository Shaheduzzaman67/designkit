import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';

import '../controllers/search_controller.dart';
import '../models/house.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;
  late SearchController controller;

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    mTheme = MaterialTheme.estateTheme;
    controller = FxControllerStore.putOrFind(SearchController());
    controller.addMarkers();
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];

    for (House house in controller.houses!) {
      list.add(_SinglePosition(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<SearchController>(
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
                              height: 0,
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
          margin: FxSpacing.top(FxSpacing.safeAreaTop(context)),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
            theme,
            mTheme,
          ));
    } else {
      return Stack(
        children: [
          GoogleMap(
            markers: controller.marker,
            onMapCreated: controller.onMapCreated,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
              new Factory<OneSequenceGestureRecognizer>(
                () => new EagerGestureRecognizer(),
              ),
            ].toSet(),
            initialCameraPosition: CameraPosition(
              target: controller.center,
              zoom: 7.0,
            ),
          ),
          Positioned(
            top: FxSpacing.safeAreaTop(context) + 20,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Expanded(
                  child: FxTextField(
                    textFieldStyle: FxTextFieldStyle.outlined,
                    filled: true,
                    fillColor: mTheme.primaryContainer,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    autoFocusedBorder: true,
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: mTheme.primary,
                      size: 20,
                    ),
                    enabledBorderRadius: mTheme.containerRadius.medium,
                    focusedBorderRadius: mTheme.containerRadius.medium,
                    labelTextColor: mTheme.primary,
                    cursorColor: mTheme.primary,
                    labelText: 'Search Location',
                    labelStyle: TextStyle(fontSize: 12, color: mTheme.primary),
                    focusedBorderColor: mTheme.primary,
                    enabledBorderColor: mTheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 100,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                pageSnapping: true,
                physics: ClampingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChange,
                children: _buildHouseList(),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class _SinglePosition extends StatelessWidget {
  final House house;

  const _SinglePosition(this.house);

  @override
  Widget build(BuildContext context) {
    MaterialThemeData mTheme = MaterialTheme.estateTheme;
    return FxContainer(
      color: mTheme.primaryContainer,
      borderRadiusAll: mTheme.containerRadius.medium,
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
      margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(mTheme.containerRadius.medium),
            child: Image(
              image: AssetImage(house.image),
              fit: BoxFit.cover,
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.b1(
                    house.name,
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                    color: mTheme.onPrimaryContainer,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_pin,
                          color: mTheme.primary,
                          size: 14,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 2),
                              child: FxText.b3(
                                house.location,
                                fontWeight: 400,
                                color: mTheme.onPrimaryContainer,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
