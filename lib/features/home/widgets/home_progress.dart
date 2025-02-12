import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class DashboardProgress extends StatelessWidget {
  DashboardProgress({
    super.key,
    required this.progress,
  });
  int progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 2,
        ),
        // set styled text indicator
        Text((progress * 10).toString(),
            style: Theme.of(context).textTheme.headlineLarge),
        Text('von'),
        Text('1000', style: Theme.of(context).textTheme.displayLarge),
        Spacer(
          flex: 2,
        ),
        // set circular indicator
        // todo create with gradient
        CircularPercentIndicator(
          radius: 48,
          lineWidth: 11,
          percent: progress / 100,
          progressColor: AppColors.accentColor,
          backgroundColor: AppColors.animalColor,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            '$progress%',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
