import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class WeekBadges extends StatelessWidget {
  WeekBadges({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    Random r = Random();
    bool result = r.nextDouble() <= 0.7;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.boxBorder, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              result == true
                  ? Assets.images.jcons.badge.svg(
                      height: 40,
                      colorFilter: ColorFilter.mode(
                          AppColors.headlineColor, BlendMode.srcIn),
                    )
                  : Assets.images.jcons.badge.svg(height: 40)
            ],
          ),
        ));
  }
}
