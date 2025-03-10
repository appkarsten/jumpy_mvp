import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/features/home/widgets/home_progress.dart';
import 'package:jumpy_mvp/features/home/widgets/select_goal.dart';
import 'package:jumpy_mvp/features/home/widgets/week_badges.dart';
import 'package:jumpy_mvp/features/user_settings/screens/user_settings.dart';
import 'package:jumpy_mvp/shared/widgets/animal_fill.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.repo, required this.prefs});
  final DatabaseRepository repo;
  final SharedPreferencesAsync prefs;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    // sample values for demonstration
    // todo update image and container sizes for responsive
    int progress = 75;
    double llamaHeight = 290;
    double fillHeight = llamaHeight / 100 * progress;
    // fake fill area math
    switch (progress) {
      case < 30:
        fillHeight *= 0.7;
      case < 60 && >= 30:
        fillHeight *= 0.8;
      case >= 60 && <= 80:
        fillHeight *= 0.8;
      case >= 80 && <= 90:
        fillHeight *= 0.88;
      case >= 90 && <= 98:
        fillHeight *= 0.92;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('See whats up'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserSettings(
                            repo: widget.repo,
                            prefs: widget.prefs,
                          )),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.boxBorder, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // call power animal builder from shared widgets
                  AnimalFill(fillHeight: fillHeight, llamaHeight: llamaHeight),
                  // call text indicator
                  // and circular indicator
                  // from home widgets
                  DashboardProgress(progress: progress)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 16,
                children: [
                  // call fake badges from home badges widget
                  // with random bool state
                  for (int i = 1; i < 15; i++) WeekBadges(title: 'Week $i')
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Personal Goal of the Week',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('How much you wand to achieve?')),
          ),
          Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // call select goal from home widgets
                  for (int i = 500; i <= 2000; i = i + 500) SelectGoal(index: i)
                ],
              )),
          Spacer(),
        ],
      ),
    );
  }
}
