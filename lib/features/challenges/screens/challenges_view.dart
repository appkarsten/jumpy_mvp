import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/widgets/show_result.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/features/challenges/widgets/challenges_card.dart';
import 'package:jumpy_mvp/shared/widgets/animal_fill.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

// width category load categories
// with state change of category
// go to challenge starter
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
            // todo find out what slivergrid... is
            // just forgot
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // set state and load challenge starter
                  setState(() {
                    category = widget.challenges[index].category;
                    counts = widget.challenges[index].counts;
                  });
                },
                child:
                    // call challenges card widget
                    ChallengesCard(challenges: widget.challenges, index: index),
              );
            },
          ),
        ),
      );
    }
    // section challenge starter
    else {
      double fillHeight = 400;
      return Scaffold(
        appBar: AppBar(
            // create go back to challenge overview
            // button
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: SizedBox(
                  height: fillHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimalFill(
                          fillHeight: fillHeight / counts * _count,
                          llamaHeight: fillHeight),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          // todo create widget in shared for circular and text indicator
                          // hard coded repeat of text and circular indicator
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

// todo rebuild with consistent micro/milli/seccond units
// todo clean min:sec:ms format
// create record button
class StopTime extends StatefulWidget {
  const StopTime({super.key, required this.count, required this.counts});
  final int count;
  final int counts;

  @override
  State<StopTime> createState() => _StopTimeState();
}

class _StopTimeState extends State<StopTime> {
  // initialize duration an timer
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    setState(() {
      // reset duration
      duration = Duration();
    });
  }

  void addTime() {
    final addMilliseconds = 1;
    // as long as count jumps < challenge jumps
    // run stopwatch
    if (widget.count < widget.counts) {
      setState(() {
        final milliseconds = duration.inMilliseconds + addMilliseconds;
        duration = Duration(milliseconds: milliseconds);
      });
    }
    // if count jumps equal challenge jumps
    // stop watch and call bottom sheet with result
    else if (widget.count == widget.counts) {
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

  // button with record symbol
  // if stopwatch startet, replay symbol with running time
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
