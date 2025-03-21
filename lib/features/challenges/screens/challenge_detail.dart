import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/widgets/activate_sensor.dart';
import 'package:jumpy_mvp/features/challenges/widgets/stop_time.dart';
import 'package:jumpy_mvp/shared/widgets/animal_fill.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChallengeDetail extends StatefulWidget {
  ChallengeDetail({
    super.key,
    required this.fillHeight,
    required this.counts,
    required int count,
  }) : _count = count;

  final double fillHeight;
  final int counts;
  int _count;

  @override
  State<ChallengeDetail> createState() => _ChallengeDetailState();
}

class _ChallengeDetailState extends State<ChallengeDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: SizedBox(
              height: widget.fillHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimalFill(
                      fillHeight:
                          widget.fillHeight / widget.counts * widget._count,
                      llamaHeight: widget.fillHeight),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      // todo create widget in shared for circular and text indicator
                      // hard coded repeat of text and circular indicator
                      Text(widget._count.toString(),
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('von'),
                      Text('${widget.counts}',
                          style: Theme.of(context).textTheme.displayLarge),
                      Spacer(
                        flex: 1,
                      ),

                      // CircularPercentIndicator(
                      //   radius: 48,
                      //   lineWidth: 11,
                      //   percent: _count / counts,
                      //   progressColor: AppColors.accentColor,
                      //   backgroundColor: AppColors.animalColor,
                      //   circularStrokeCap: CircularStrokeCap.round,
                      //   center: Text(
                      //     '${(_count / counts * 100).toStringAsFixed(1)}%',
                      //     style: Theme.of(context).textTheme.titleMedium,
                      //   ),
                      // ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
          // StopTime(count: _count, counts: counts),
          ActivateSensor(
            counts: widget.counts,
            countJump: () {
              widget._count++;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
