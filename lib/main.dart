import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/data/database_repository.dart';
import 'package:jumpy_mvp/features/challenges/data/mock_database.dart';
import 'package:jumpy_mvp/features/challenges/models/challenge.dart';
import 'package:jumpy_mvp/main_screen.dart';

void main() {
  DatabaseRepository mockDatabase = MockDatabase();
  final List<Challenge> allChallenges = mockDatabase.getChallenges();

  runApp(MainApp(
    challenges: allChallenges,
  ));
}
