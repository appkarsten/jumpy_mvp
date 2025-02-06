import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/features/challenges/widgets/challenges_card.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChallengesPage extends StatefulWidget {
  ChallengesPage({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  String category = '';
  int counts = 0;
  double fillHeight = 0;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    if (category == '') {
      return Scaffold(
        appBar: AppBar(title: Text('Select your Challenge $category')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GridView.builder(
            itemCount: widget.challenges.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    category = widget.challenges[index].category;
                    counts = widget.challenges[index].counts;
                  });
                },
                child:
                    ChallengesCard(challenges: widget.challenges, index: index),
              );
            },
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                setState(() {
                  category = '';
                  _count = 0;
                });
              },
              icon: Icon(
                Icons.chevron_left_outlined,
                size: 30,
                color: AppColors.textColor,
              ),
            ),
            title: Column(
              children: [
                Text('Challenge'),
                Text('$counts $category'),
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: Column(
            children: [
              Container(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                            height: 400 / counts * _count,
                            width: 190,
                            decoration:
                                BoxDecoration(color: AppColors.animalColor)),
                      ),
                      Assets.images.powerAnimals.lama.image(height: 400),
                    ]),
                    //DashboardProgress(progress: progress)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Text(_count.toString(),
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text('von'),
                        Text('$counts',
                            style: Theme.of(context).textTheme.bodyLarge),
                        Spacer(
                          flex: 1,
                        ),
                        CircularPercentIndicator(
                          radius: 48,
                          lineWidth: 11,
                          percent: _count / counts,
                          progressColor: AppColors.accentColor,
                          backgroundColor: AppColors.animalColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '${(_count / counts * 100).toStringAsFixed(1)}%',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
              StopTime(count: _count, counts: counts),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_count < counts) _count++;
              });
            },
            child: Text(
              '+',
              style: Theme.of(context).textTheme.headlineLarge,
            )),
      );
    }
  }
}

class StopTime extends StatefulWidget {
  const StopTime({super.key, required this.count, required this.counts});
  final int count;
  final int counts;

  @override
  State<StopTime> createState() => _StopTimeState();
}

class _StopTimeState extends State<StopTime> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    setState(() {
      duration = Duration();
    });
  }

  void addTime() {
    final addMilliseconds = 1;
    if (widget.count < widget.counts) {
      setState(() {
        final milliseconds = duration.inMilliseconds + addMilliseconds;
        duration = Duration(milliseconds: milliseconds);
      });
    } else if (widget.count == widget.counts) {
      timer?.cancel();
      timer = null;
      showModalBottomSheet(
          isScrollControlled: true,
          barrierColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (builder) {
            return ShowResult(context: context, duration: duration);
          });
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(microseconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }

  Widget buildTime() {
    return InkWell(
        onTap: () {
          startTimer();
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.animalColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: duration.inSeconds == 0
              ? Icon(Icons.play_arrow, size: 50)
              : Align(
                  alignment: Alignment.center,
                  child: Text('${duration.inSeconds} ms',
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
        ));
  }
}

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
                  style: Theme.of(context).textTheme.bodyLarge,
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
