// import '../models/report.dart';
import '../models/challenge.dart';
import '../models/user.dart';

abstract class DatabaseRepository {
  // User Methods
  void addUser(User user);
  List<User> getUsers();

  void deleteUser();
  // void updateUser(User oldUser, User newUser);
  // // End User

  // // Report Methods to Record Leaderboard
  // void addReport(Report report);
  // List<Report> getReports();
  // // End Report

  // Challenge Methos
  void addChallenge(Challenge challenge);
  List<Challenge> getChallenges();
  // End Challenge
}
