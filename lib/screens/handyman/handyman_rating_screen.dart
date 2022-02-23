import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HandymanRatingScreen extends StatefulWidget {
  @override
  _HandymanRatingScreenState createState() => _HandymanRatingScreenState();
}

class _HandymanRatingScreenState extends State<HandymanRatingScreen> {
  int? _radioValue = 1;

  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(MdiIcons.chevronLeft),
            ),
            title: FxText.h6("Send us Feedback", fontWeight: 600)),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: FxSpacing.symmetric(vertical: 24, horizontal: 16),
              color: theme.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.sh1("Send us your feedback!", fontWeight: 700),
                  Container(
                      margin: FxSpacing.top(4),
                      child: FxText.b2(
                          "Do you have a suggestion or found a mistakes?",
                          fontWeight: 500)),
                  FxText.b2("Let us know by fill this form", fontWeight: 500),
                ],
              ),
            ),
            Container(
              padding: FxSpacing.only(top: 16, left: 16),
              child: FxText.sh1("How was your experience?", fontWeight: 700),
            ),
            Container(
              padding: FxSpacing.only(top: 8, left: 16),
              child: Row(
                children: <Widget>[
                  Icon(MdiIcons.emoticonOutline,
                      color: theme.colorScheme.primary, size: 32),
                  Container(
                      margin: FxSpacing.left(4),
                      child: Icon(MdiIcons.emoticonNeutralOutline,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32)),
                  Container(
                      margin: FxSpacing.left(4),
                      child: Icon(MdiIcons.emoticonSadOutline,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32)),
                ],
              ),
            ),
            Container(
              padding: FxSpacing.only(top: 24, left: 16, right: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Describe your experience",
                  isDense: true,
                  filled: true,
                  fillColor: theme.colorScheme.background,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                textCapitalization: TextCapitalization.sentences,
                minLines: 5,
                maxLines: 10,
              ),
            ),
            Container(
              padding: FxSpacing.only(top: 24, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    visualDensity: VisualDensity.compact,
                    activeColor: theme.colorScheme.primary,
                    groupValue: _radioValue,
                    onChanged: (int? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  FxText.b2("Suggestion", fontWeight: 600),
                  Container(
                    margin: FxSpacing.left(8),
                    child: Radio(
                      value: 2,
                      visualDensity: VisualDensity.compact,
                      activeColor: theme.colorScheme.primary,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value;
                        });
                      },
                    ),
                  ),
                  FxText.b2("Mistakes", fontWeight: 600),
                  Container(
                    margin: FxSpacing.left(8),
                    child: Radio(
                      value: 3,
                      visualDensity: VisualDensity.compact,
                      activeColor: theme.colorScheme.primary,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value;
                        });
                      },
                    ),
                  ),
                  FxText.b2("Others", fontWeight: 600),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: FxSpacing.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withAlpha(28),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: FxText.b1("Send Feedback",
                    color: theme.colorScheme.onSecondary),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(FxSpacing.xy(16, 0))),
              ),
            ),
          ],
        ));
  }
}
