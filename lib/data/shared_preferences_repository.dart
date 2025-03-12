import 'dart:convert';

import 'package:jumpy_mvp/data/shared_database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository implements SharedDatabaseRepository {
  final _key = 'user_settings';
  String _settings = '';

  @override
  Future<String> getSettings() async {
    final settings = await SharedPreferences.getInstance();
    _settings = settings.getString(_key) ?? '';
    return _settings;
  }

  @override
  Future<void> saveSettings(Map<String, dynamic> _settings) async {
    //make sure item doesn't exist yet and is not empty
    // if (item.isNotEmpty && !_settings.contains(item)) {
    final settings = await SharedPreferences.getInstance();
    final String _settingsString = jsonEncode(_settings);
    await settings.setString(_key, _settingsString);
    // }
    // _items.add(item);
  }
}
