import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({
    super.key,
    required this.context,
    required this.duration,
  });

  final BuildContext context;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        height: MediaQuery.sizeOf(context).height - 200,
        decoration: BoxDecoration(
            color: AppColors.mainBackground.withValues(alpha: 0.9)),
        width: MediaQuery.sizeOf(context).width - 80,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/users/user_1.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  duration.inSeconds.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'WELL DONE',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: null, child: Text('Show Leaderboard')),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: null, child: Text('Challenge a Friend')),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    ElevatedButton(onPressed: null, child: Text('Try Again')),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
