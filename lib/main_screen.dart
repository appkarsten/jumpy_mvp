import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/features/auth/view/login_page.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/features/home/screens/home_view.dart';
import 'package:jumpy_mvp/features/challenges/screens/challenges_view.dart';
import 'package:jumpy_mvp/features/ranking/screens/ranking_view.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:jumpy_mvp/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({required this.repo, super.key});
  final DatabaseRepository repo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // load theme
      theme: AppTheme().lightTheme,
      home: JumpyApp(
        repo: repo,
        //challenges: challenges,
        //users: users,
      ),
    );
  }
}

class JumpyApp extends StatefulWidget {
  const JumpyApp({required this.repo, super.key});
  final DatabaseRepository repo;

  @override
  State<JumpyApp> createState() => _JumpyAppState();
}

class _JumpyAppState extends State<JumpyApp> {
  int _activeIndex = 0;
  // TODO uncomment for loading on start
  // List<User> getAllUser = [];
  // List<Challenge> getAllChallenge = [];
  // Future<void> getAllChallenges() async {
  //   getAllChallenge = await widget.repo.getChallenges();
  //   setState(() {});
  // }
  // Future<void> getAllUsers() async {
  //   getAllUser = await widget.repo.getUsers();
  //   setState(() {});
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   getAllChallenges();
  //   getAllUsers();
  // }

  // initialize main menu and send users and challenges lists
  List<Widget> _screens = [];

  @override
  Widget build(BuildContext context) {
    _screens = [
      Dashboard(
        repo: widget.repo, // Home Screen with statistic
      ),
      ChallengesPage(
        repo: widget.repo,
        // challenges: getAllChallenge,
      ), // Choose your Game
      Ranking(
        repo: widget.repo,
      ), // Filter the Best
      LoginPage(repo: widget.repo), // Community
    ];
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: SizedBox(
        height: 88,
        child: BottomNavigationBar(
          currentIndex: _activeIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          selectedItemColor: AppColors.headlineColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _activeIndex = index;
            });
          },
          items: [
            jumpyNavigationItem('home'),
            jumpyNavigationItem('challenges'),
            jumpyNavigationItem('ranking'),
            jumpyNavigationItem('friends'),
          ],
        ),
      ),
    );
  }

  // build BottomNavigationBarItems with SVGs from Path
  BottomNavigationBarItem jumpyNavigationItem(String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SvgPicture.asset(
          'assets/images/menu/$label.svg',
          height: 45,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SvgPicture.asset(
          'assets/images/menu/$label.svg',
          colorFilter:
              ColorFilter.mode(AppColors.headlineColor, BlendMode.srcIn),
          height: 45,
        ),
      ),
    );
  }
}
