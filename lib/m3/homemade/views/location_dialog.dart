import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/location_dialog_controller.dart';

class LocationDialog extends StatefulWidget {
  const LocationDialog({Key? key}) : super(key: key);

  @override
  _LocationDialogState createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late LocationDialogController locationDialogController;

  @override
  void initState() {
    super.initState();
    locationDialogController =
        FxControllerStore.putOrFind(LocationDialogController());
    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder(
        controller: locationDialogController,
        builder: (controller) {
          return Dialog(
            insetPadding: FxSpacing.x(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
              padding: FxSpacing.xy(16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: FxText.b1(
                      "Choose Location",
                      color: mTheme.primary,
                      fontWeight: 600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FxSpacing.height(24),
                  FxContainer.bordered(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    paddingAll: 0,
                    border: Border.all(color: mTheme.card, width: 1),
                    child: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                child: FxContainer(
                                  padding: FxSpacing.all(20),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FeatherIcons.mapPin,
                                        size: 20,
                                        color: mTheme.primary,
                                      ),
                                      FxSpacing.width(16),
                                      FxText.b2(
                                        "Current",
                                        color: theme.colorScheme.onBackground,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: mTheme.card,
                                thickness: 0.9,
                                width: 0,
                              ),
                              FxContainer(
                                borderRadiusAll: 0,
                                color: mTheme.primary.withAlpha(48),
                                padding: FxSpacing.all(20),
                                child: Row(
                                  children: [
                                    Icon(
                                      FeatherIcons.home,
                                      size: 20,
                                      color: mTheme.primary,
                                    ),
                                    FxSpacing.width(16),
                                    FxText.b2(
                                      "Home",
                                      color: mTheme.primary,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                          thickness: 0.9,
                          color: mTheme.card,
                        ),
                        FxContainer(
                          padding: FxSpacing.fromLTRB(16, 16, 16, 20),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.search,
                                size: 20,
                                color: mTheme.primary,
                              ),
                              FxSpacing.width(16),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      isDense: true,
                                      hintStyle: FxTextStyle.b2(),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      hintText: "Search by Location",
                                      contentPadding: FxSpacing.zero),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  FxSpacing.height(24),
                  FxButton(
                      borderRadiusAll: 4,
                      elevation: 0,
                      onPressed: () {
                        locationDialogController.confirm();
                      },
                      backgroundColor: mTheme.primary,
                      child: FxText(
                        "Confirm",
                        color: mTheme.onPrimary,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
