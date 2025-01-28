class Challenge {
  int id;
  String name;
  String description;
  Challenge({required this.id, required this.name, required this.description});

  describe() {
    print(description);
  }
}
