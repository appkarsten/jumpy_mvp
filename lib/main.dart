import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/mock_database.dart';
import 'package:jumpy_mvp/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final DatabaseRepository repo = MockDatabaseRepository();
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  runApp(MainApp(
    repo: repo,
    prefs: prefs,
  ));
}
