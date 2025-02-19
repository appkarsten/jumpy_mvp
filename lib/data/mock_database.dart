import 'package:jumpy_mvp/data/challenges.mock.dart';
import 'package:jumpy_mvp/data/users.mock.dart';

import '../models/challenge.dart';
import '../models/user.dart';
import 'database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final List<User> _users = [...users];
  final List<Challenge> _challenges = [...challenges];

  // @override
  // Future<List<User>> getUsers() async {
  //   return Future.delayed(Duration(seconds: 4), () => _users);
  // }
  @override
  Future<List<User>> getUsers() async {
    return Future.delayed(Duration(seconds: 5), () => _users);
  }

  @override
  Future<List<Challenge>> getChallenges() async {
    return Future.delayed(Duration(seconds: 5), () => _challenges);
  }
}
