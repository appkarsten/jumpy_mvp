import 'package:jumpy_mvp/data/challenges.mock.dart';
import 'package:jumpy_mvp/data/users.mock.dart';

import '../models/challenge.dart';
import '../models/user.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  final List<User> _users = [
    ...users,
  ];
  final List<Challenge> _challenges = [...challenges];

  @override
  List<User> getUsers() {
    return _users;
  }

  @override
  List<Challenge> getChallenges() {
    return _challenges;
  }
}
