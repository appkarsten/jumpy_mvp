class User {
  int id;
  String name;
  String email;
  DateTime createdAt;
  DateTime lastLogin;
  String role;
  bool isVerified;

  // Konstruktor
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.lastLogin,
    required this.role,
    required this.isVerified,
  });

  // 3. Zeit seit der letzten Anmeldung in Stunden
  int? lastSeen() {
    return DateTime.now().difference(lastLogin).inHours;
  }
}

class UserDetail extends User {
  DateTime bDay;
  String picture;
  String powerAnimal;
  bool reminder;
  bool sounds;
  bool motivations;
  UserDetail({
    required super.id,
    required super.name,
    required super.email,
    required super.createdAt,
    required super.lastLogin,
    required super.role,
    required super.isVerified,
    required this.bDay,
    required this.picture,
    required this.powerAnimal,
    required this.reminder,
    required this.sounds,
    required this.motivations,
  });
}
