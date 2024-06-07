import 'package:flutter/material.dart';
import 'package:flutter_data_base/main_screen.dart';
import 'package:flutter_data_base/src/data/database_repository.dart';

class App extends StatelessWidget {
  final DatabaseRepository db;
  const App({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(db: db),
    );
  }
}
