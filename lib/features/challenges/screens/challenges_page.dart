import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/models/challenge.dart';

class ChallengesPage extends StatelessWidget {
  ChallengesPage({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select your Challenge')),
      body: Container(
        child: Text(challenges.length.toString()),
      ),
    );
  }
}
