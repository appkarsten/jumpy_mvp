import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/dashboard/screens/dashboard_page.dart';
import 'package:jumpy_mvp/features/challenges/screens/challenges_page.dart';
import 'package:jumpy_mvp/features/friends/friends_page.dart';
import 'package:jumpy_mvp/features/ranking/screens/ranking_page.dart';

class JumpyApp extends StatefulWidget {
  const JumpyApp({super.key});

  @override
  State<JumpyApp> createState() => _JumpyAppState();
}

class _JumpyAppState extends State<JumpyApp> {
  int _activeIndex = 0;
  final List<Widget> _screens = [
    const Dashboard(), // Home Screen with statistic
    const Challenges(), // Choose your Game
    const Ranking(), // Filter the Best
    const Friends(), // Community
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   'see what\'s up',
      //   style: textTheme.headlineLarge,
      // )),
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
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
          // BottomNavigationBarItem(
          //   label: 'Friends',
          //   icon: Icon(Icons.account_tree_sharp),
          // ),
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //     selectedIndex: _activeIndex,
      //     //indicatorColor: buttonBackground,
      //     onDestinationSelected: (int index) {
      //       setState(() {
      //         _activeIndex = index;
      //       });
      //     },
      //     destinations: const <Widget>[
      //       NavigationDestination(
      //         icon: Icon(Icons.image),
      //         label: 'Gallery',
      //       ),
      //       NavigationDestination(
      //         icon: Icon(Icons.person),
      //         label: 'Über mich',
      //       ),
      //     ]),
    );
  }
}
