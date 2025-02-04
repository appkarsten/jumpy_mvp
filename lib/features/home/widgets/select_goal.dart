import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class SelectGoal extends StatelessWidget {
  const SelectGoal({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.boxBorder, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text('$index', style: Theme.of(context).textTheme.headlineMedium),
          Text('EPs', style: Theme.of(context).textTheme.titleMedium),
        ]),
      ),
    );
  }
}
