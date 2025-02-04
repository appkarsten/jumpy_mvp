import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/home/widgets/dashboard_progress.dart';
import 'package:jumpy_mvp/features/home/widgets/select_goal.dart';
import 'package:jumpy_mvp/features/home/widgets/week_badges.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    int progress = 76;
    double llamaHeight = 290;
    double fillHeight = llamaHeight / 100 * progress;
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
      appBar: AppBar(title: Text('See whats up')),
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
                  Stack(children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                          height: fillHeight,
                          width: 150,
                          decoration:
                              BoxDecoration(color: AppColors.animalColor)),
                    ),
                    Assets.images.powerAnimals.llama.svg(height: llamaHeight),
                  ]),
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
                  for (int i = 500; i <= 2000; i = i + 500) SelectGoal(index: i)
                ],
              )),
          Spacer(),
        ],
      ),
    );
  }
}
