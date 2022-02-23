/*
* File : Payment Done
* Version : 1.0.0
* */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:flutkit/theme/app_theme.dart';

class PaymentProgress extends StatefulWidget {
  @override
  _PaymentProgressState createState() => _PaymentProgressState();
}

class _PaymentProgressState extends State<PaymentProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    startTimer();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = const Duration(seconds: 2);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _PaymentDoneDialog();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: FxSpacing.all(16),
            child: Center(
                child: isInProgress
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ))
                    : FxButton(
                        backgroundColor: theme.colorScheme.primary,
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: FxText.b2("Proceed Payment",
                            color: theme.colorScheme.onPrimary)))));
  }
}

class _PaymentDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: FxSpacing.all(16),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(child: FxText.sh1("Thank You!", fontWeight: 700)),
            ),
            Container(
              child: Center(
                  child: FxText.b2(
                "Your transaction was successful",
              )),
            ),
            Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
            Container(
              margin: FxSpacing.top(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.b2(
                        "DATE",
                      ),
                      FxText.sh2("12, April 2020", fontWeight: 600),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FxText.b2(
                        "TIME",
                      ),
                      FxText.sh2("8:20 PM", fontWeight: 600)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.b2(
                        "TO",
                      ),
                      FxText.sh2("Bronte Mcclure", fontWeight: 600),
                      FxText.b2(
                        "bronte@gmail.com",
                      ),
                    ],
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('./assets/images/avatar-3.jpg'),
                          fit: BoxFit.fill),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.b2(
                    "AMOUNT",
                  ),
                  FxText.sh2("\$ 12,000", fontWeight: 600),
                ],
              ),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                child: FxButton(
                  backgroundColor: theme.colorScheme.primary,
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: FxText.caption("COMPLETE",
                      color: theme.colorScheme.onPrimary, letterSpacing: 0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
