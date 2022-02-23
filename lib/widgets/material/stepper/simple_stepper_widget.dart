/*
* File : Simple Stepper
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class SimpleStepperWidget extends StatefulWidget {
  @override
  _SimpleStepperWidgetState createState() => _SimpleStepperWidgetState();
}

class _SimpleStepperWidgetState extends State<SimpleStepperWidget> {
  int _currentStep = 2;

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
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.sh1("Stepper", fontWeight: 600),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stepper(
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep >= 4) return;
                setState(() {
                  _currentStep += 1;
                });
              },
              onStepCancel: () {
                if (_currentStep <= 0) return;
                setState(() {
                  _currentStep -= 1;
                });
              },
              onStepTapped: (pos) {
                setState(() {
                  _currentStep = pos;
                });
              },
              steps: <Step>[
                Step(
                  isActive: true,
                  state: StepState.complete,
                  title: FxText.sh1('Step 1', fontWeight: 600),
                  content: SizedBox(
                      height: 60.0,
                      child: FxText.sh2("Completed (content is here)",
                          fontWeight: 500)),
                ),
                Step(
                  isActive: true,
                  state: StepState.complete,
                  title: FxText.sh1('Step 2', fontWeight: 600),
                  content: SizedBox(
                      height: 60.0,
                      child: FxText.sh2("Completed (content is here)",
                          fontWeight: 500)),
                ),
                Step(
                  isActive: true,
                  state: StepState.editing,
                  title: FxText.sh1('Step 3', fontWeight: 600),
                  content: SizedBox(
                      height: 60.0,
                      child: FxText.sh2("Editing (content is here)",
                          fontWeight: 500)),
                ),
                Step(
                  isActive: true,
                  title: FxText.sh1('Step 4', fontWeight: 600),
                  content: SizedBox(
                      height: 60.0,
                      child: FxText.sh2("Uncompleted (content is here)",
                          fontWeight: 500)),
                ),
                Step(
                  state: StepState.disabled,
                  title: FxText.sh1('Step 5', fontWeight: 600),
                  content: SizedBox(
                      height: 60.0,
                      child: FxText.sh2("Disabled (content is here)",
                          fontWeight: 500)),
                ),
              ],
            ),
          ),
        ));
  }
}
