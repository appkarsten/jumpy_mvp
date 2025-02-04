class Report {
  double seconds;
  int userId;
  String challenge;

  Report(
    this.userId,
    this.seconds,
    this.challenge,
  );
  void save() {
    print('save 2 DB. Keine Ahnung wie das geht');
  }
}
