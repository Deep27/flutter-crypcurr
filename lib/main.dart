import 'package:flutter/material.dart';

import 'currencies_list.dart';

void main() => runApp(CCTracker());

class CCTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CC Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CurrenciesList(),
    );
  }
}
