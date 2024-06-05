import 'package:flutter/material.dart';
import 'package:flutter_data_base/listscreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste mit Textfeld',
      home: ListScreen(),
    );
  }
}