import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/auth/view/login_page.dart';
import 'package:jumpy_mvp/features/challenges/models/challenge.dart';
import 'package:jumpy_mvp/features/dashboard/screens/dashboard_page.dart';
import 'package:jumpy_mvp/features/challenges/screens/challenges_page.dart';
import 'package:jumpy_mvp/features/friends/friends_page.dart';
import 'package:jumpy_mvp/features/ranking/screens/ranking_page.dart';
import 'package:jumpy_mvp/theme/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      home: JumpyApp(
        challenges: challenges,
      ),
    );
  }
}

class JumpyApp extends StatefulWidget {
  const JumpyApp({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  State<JumpyApp> createState() => _JumpyAppState();
}

class _JumpyAppState extends State<JumpyApp> {
  int _activeIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      const Dashboard(), // Home Screen with statistic
      ChallengesPage(
        challenges: widget.challenges,
      ), // Choose your Game
      const Ranking(), // Filter the Best
      const LoginPage(), // Community
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.abc),
          ),
          BottomNavigationBarItem(
            label: 'Challenges',
            icon: Icon(Icons.accessible_forward),
          ),
          BottomNavigationBarItem(
            label: 'Ranking',
            icon: Icon(Icons.access_alarm_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Friends',
            icon: Icon(Icons.account_tree_sharp),
          ),
        ],
      ),
    );
  }
}
