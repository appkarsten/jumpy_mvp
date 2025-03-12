import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/mock_database.dart';
import 'package:jumpy_mvp/data/shared_database_repository.dart';
import 'package:jumpy_mvp/data/shared_preferences_repository.dart';
import 'package:jumpy_mvp/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final DatabaseRepository repo = MockDatabaseRepository();
  final SharedDatabaseRepository prefs = SharedPreferencesRepository();

  runApp(MainApp(
    repo: repo,
    prefs: prefs,
  ));
}
