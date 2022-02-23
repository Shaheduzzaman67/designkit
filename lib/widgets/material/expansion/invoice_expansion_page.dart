/*
* File : Invoice Expansion
* Version : 1.0.0
* */

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

class InvoiceExpansionPage extends StatefulWidget {
  @override
  _InvoiceExpansionPageState createState() => _InvoiceExpansionPageState();
}

class _InvoiceExpansionPageState extends State<InvoiceExpansionPage> {
  List<bool> _dataExpansionPanel = [true, false, true];

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
          title: FxText.sh1("Invoice", fontWeight: 600),
        ),
        body: Container(
          color: theme.backgroundColor,
          child: ListView(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FxText.sh2("Invoice", fontWeight: 600),
                        FxText.b1("# 100457", fontWeight: 500),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        FxText.sh2("Date", fontWeight: 600),
                        FxText.b1("8, Jun", fontWeight: 500),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: theme.backgroundColor,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _dataExpansionPanel[index] = !isExpanded;
                        });
                      },
                      animationDuration: Duration(milliseconds: 500),
                      children: <ExpansionPanel>[
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: FxText.sh1("Personal Information",
                                      fontWeight: isExpanded ? 700 : 600,
                                      letterSpacing: 0));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 24, right: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FxText.sh2("Mr. Rodrigo Pierce",
                                        height: 1.4, fontWeight: 500),
                                    FxText.sh2("rog_pie@gmail.com",
                                        height: 1.4,
                                        fontWeight: 500,
                                        letterSpacing: 0.3),
                                    FxText.sh2("Contact : (047) 98760235 ",
                                        fontWeight: 500, height: 1.4),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[0]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: FxText.sh1("Address",
                                      fontWeight: isExpanded ? 700 : 600,
                                      letterSpacing: 0));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 24, right: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FxText.sh2("4675  Hartland Avenue",
                                        fontWeight: 500, height: 1.4),
                                    FxText.sh2("Ashwa - 54304",
                                        fontWeight: 500, height: 1.4),
                                    FxText.sh2("United Kingdom ",
                                        fontWeight: 500, height: 1.4),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[1]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: FxText.sh1("Bill",
                                      fontWeight: isExpanded ? 700 : 600,
                                      letterSpacing: 0));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 24, right: 24),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FxText.sh1("Subtotal",
                                            fontWeight: 600, height: 1.4),
                                        FxText.sh1("\$  299.99",
                                            fontWeight: 600, height: 1.4),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          FxText.sh1("Shipping cost",
                                              fontWeight: 600, height: 1.4),
                                          FxText.sh1("\$  49",
                                              fontWeight: 600, height: 1.4),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          FxText.sh1("Taxes",
                                              fontWeight: 600, height: 1.4),
                                          FxText.sh1("\$  29",
                                              fontWeight: 600, height: 1.4),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          FxText.sh1("Total",
                                              height: 1.4, fontWeight: 800),
                                          FxText.sh1("\$  399",
                                              height: 1.4, fontWeight: 800),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[2])
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
