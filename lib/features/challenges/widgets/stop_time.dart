import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/widgets/show_result.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

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
