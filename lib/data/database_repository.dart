import '../models/challenge.dart';
import '../models/user.dart';

abstract class DatabaseRepository {
  // List of Challenges
  List<Challenge> getChallenges();

  // List of Users
  List<User> getUsers();
}
