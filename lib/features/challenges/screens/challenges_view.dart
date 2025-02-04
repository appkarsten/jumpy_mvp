import 'package:flutter/material.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/features/challenges/widgets/challenges_card.dart';

class ChallengesPage extends StatelessWidget {
  ChallengesPage({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select your Challenge')),
      body: GridView.builder(
        itemCount: challenges.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ChallengesCard(challenges: challenges, index: index);
        },
      ),
    );
  }
}
