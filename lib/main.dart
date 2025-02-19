import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/mock_database.dart';
import 'package:jumpy_mvp/main_screen.dart';

void main() {
  final DatabaseRepository repo = MockDatabaseRepository();

  runApp(MainApp(
    repo: repo,
  ));
}
