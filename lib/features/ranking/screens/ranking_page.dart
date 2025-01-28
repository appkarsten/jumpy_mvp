import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  const Ranking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Highscore Ranking')),
      body: Text('See all the pretty people'),
    );
  }
}
