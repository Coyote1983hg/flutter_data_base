import 'package:flutter_data_base/src/data/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefsDatabase implements DatabaseRepository {
  @override
  Future<String?> getNameFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // LESEN
    return prefs.getString("first");
  }

  @override
  Future<void> storeName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // SPEICHERN
    await prefs.setString("first", name);
  }
}
