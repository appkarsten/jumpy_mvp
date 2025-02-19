import '../models/challenge.dart';
import '../models/user.dart';

abstract class DatabaseRepository {
  // List of Challenges
  Future<List<Challenge>> getChallenges();

  // List of Users
  Future<List<User>> getUsers();
}
