import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/mock_database.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/main_screen.dart';

void main() {
  DatabaseRepository mockDatabase = MockDatabase();

  final List<Challenge> allChallenges = mockDatabase.getChallenges();
  //final List<User> allUsers = mockDatabase.getUsers();

  runApp(MainApp(
    challenges: allChallenges,
  ));
}
