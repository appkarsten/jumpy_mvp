import 'package:jumpy_mvp/data/challenges.mock.dart';
import 'package:jumpy_mvp/data/users.mock.dart';

import '../models/challenge.dart';
import '../models/user.dart';
import 'database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  List<User> _users = [];
  List<Challenge> _challenges = [];

  @override
  Future<List<User>> getUsers() async {
    if (_users.isNotEmpty) {
      return _users;
    } else {
      await Future.delayed(Duration(seconds: 5));
      _users = [...users];
      return _users;
    }
  }

  @override
  Future<List<Challenge>> getChallenges() async {
    if (_challenges.isNotEmpty) {
      return _challenges;
    } else {
      await Future.delayed(Duration(seconds: 5));
      _challenges = [...challenges];
      return _challenges;
    }
  }
}
