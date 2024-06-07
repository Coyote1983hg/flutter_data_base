import 'package:flutter/material.dart';
import 'package:flutter_data_base/app.dart';
import 'package:flutter_data_base/src/data/database_repository.dart';
import 'package:flutter_data_base/src/data/shared_prefs_database.dart';

void main() {
  DatabaseRepository db = SharedPrefsDatabase();

  runApp(App(db: db));
}
