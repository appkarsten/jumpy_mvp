import '../models/challenge.dart';
import '../models/user.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  List<User> users = [
    User(
      id: 1,
      email: 'stnstn@posteo.de',
      name: 'Sten',
      role: 'Admin',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 2,
      email: 'user@email.de',
      name: 'Daniela',
      role: 'User',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 3,
      email: 'micha@posteo.de',
      name: 'Micha',
      role: 'User',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 4,
      email: 'sabine@gmx.de',
      name: 'Sabi',
      role: 'User',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 5,
      email: 'tobias@yahoo-online.de',
      name: 'Tobi',
      role: 'Surfer',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 6,
      email: 'Erik@garagen-bau-online.de',
      name: 'Erik the Man',
      role: 'Surfer',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 7,
      email: 'knäcke@posteo.de',
      name: 'knäcke',
      role: 'Surfer',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 8,
      email: 'juliblau@posteo.de',
      name: 'Juli',
      role: 'Surfer',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 9,
      email: 'jenny@fromtheblock.usa',
      name: 'J.',
      role: 'User',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 10,
      email: 'caroline@freenet.de',
      name: 'caro',
      role: 'User',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
    User(
      id: 11,
      email: 'christl@aol.de',
      name: 'chrissi',
      role: 'Surfer',
      isVerified: true,
      createdAt: DateTime.now(),
      lastLogin: DateTime.now(),
    ),
  ];
  List<Challenge> challenges = [
    Challenge(
        counts: 50,
        category: 'Jumps',
        description: 'try to 50 times as fast as possible'),
    Challenge(
        counts: 100,
        category: 'Jumps',
        description: 'try to 100 times as fast as possible'),
    Challenge(
        counts: 30,
        category: 'SquatJumps',
        description: 'try to 30 times as fast as possible'),
    Challenge(
        counts: 60,
        category: 'SquatJumps',
        description: 'try to 60 times as fast as possible'),
    Challenge(
        counts: 20,
        category: 'Rotations',
        description: 'try to 20 times as fast as possible'),
    Challenge(
        counts: 40,
        category: 'Rotations',
        description: 'try to 40 times as fast as possible'),
  ];

  // @override
  // void addUser(User user) {
  //   userData.add(user);
  // }

  // @override
  // List<User> getUsers() {
  //   return userData;
  // }
  // @override
  // void deleteUser() {
  //   userData.removeLast();
  // }

  @override
  void addChallenge(Challenge challenge) {
    challenges.add(challenge);
  }

  @override
  List<User> getUsers() {
    return users;
  }

  @override
  List<Challenge> getChallenges() {
    return challenges;
  }
}
