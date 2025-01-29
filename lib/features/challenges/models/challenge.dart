class Challenge {
  int counts;
  String category;
  String description;
  Challenge(
      {required this.counts,
      required this.category,
      required this.description});

  describe() {
    print(description);
  }
}
