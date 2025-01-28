import '../models/challenge.dart';
import '../models/user.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  List<User> userData = [];
  List<Challenge> challenges = [
    Challenge(
        id: 1,
        name: '50 Jumps',
        description: 'try to 50 times as fast as possible'),
    Challenge(
        id: 2,
        name: '100 Jumps',
        description: 'try to 100 times as fast as possible'),
    Challenge(
        id: 3,
        name: '30 Squat Jumps',
        description: 'try to 30 times as fast as possible'),
    Challenge(
        id: 4,
        name: '60 Squat Jumps',
        description: 'try to 60 times as fast as possible'),
    Challenge(
        id: 5,
        name: '20 Rotation Jumps',
        description: 'try to 20 times as fast as possible'),
    Challenge(
        id: 6,
        name: '40 Rotation Jumps',
        description: 'try to 40 times as fast as possible'),
  ];

  @override
  void addUser(User user) {
    userData.add(user);
  }

  @override
  List<User> getUsers() {
    return userData;
  }

  @override
  void addChallenge(Challenge challenge) {
    challenges.add(challenge);
  }

  @override
  List<Challenge> getChallenges() {
    return challenges;
  }

  @override
  void deleteUser() {
    userData.removeLast();
  }
}
