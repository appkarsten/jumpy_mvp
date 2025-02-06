import 'package:flutter/material.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ChallengesCard extends StatelessWidget {
  const ChallengesCard({
    super.key,
    required this.challenges,
    required this.index,
  });

  final List<Challenge> challenges;
  final int index;

  @override
  Widget build(BuildContext context) {
    double side = index % 2 == 0 ? 0.02 : -0.02;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: /*Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.01)
          ..rotateY(side),
        alignment: FractionalOffset.center,
        child: */
          Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.mainBackground,
          borderRadius: BorderRadius.circular(25),
          //border: Border.all(color: Colors.black45),
          boxShadow: [
            BoxShadow(
              color: AppColors.boxShadow,
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(challenges[index].counts.toString(),
                  style: Theme.of(context).textTheme.titleLarge),
              Text(challenges[index].category,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

class ChallengeDetailPage extends StatelessWidget {
  const ChallengeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('fsdsdfsdf'));
  }
}
