import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ActivateSensor extends StatefulWidget {
  final VoidCallback countJump;
  final int counts;
  const ActivateSensor(
      {super.key, required this.counts, required this.countJump});

  @override
  State<ActivateSensor> createState() => _ActivateSensorState();
}

class _ActivateSensorState extends State<ActivateSensor> {
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    duration = Duration();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  StreamSubscription? _subscription;
  bool isJumping = false;
  List<double> accelerationBuffer = [];
  List<double> countJumps = [];
  List<Widget> sensorData = [];
  List<List<double>> _accelerator = [];

  void _startListening() {
    _subscription?.cancel();
    sensorData = [];
    countJumps = [];
    _subscription = userAccelerometerEventStream().listen(
      (UserAccelerometerEvent event) {
        _accelerator.insert(0, [event.x, event.y, event.z]);
        sensorData.insert(
            0,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_accelerator[0][0].toStringAsFixed(2)),
                Text(_accelerator[0][1].toStringAsFixed(2)),
                Text(_accelerator[0][2].toStringAsFixed(2)),
              ],
            ));
        setState(() {});
        if (_accelerator[0][1] > 1 &&
            _accelerator[0][2] > 1 &&
            // _accelerator[1][2] < 0 &&
            !isJumping) {
          isJumping = true;
          // isJumping = true;
          sensorData.insert(
              0,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('0', style: TextStyle(backgroundColor: Colors.green)),
                  Text('0', style: TextStyle(backgroundColor: Colors.green)),
                  Text('0', style: TextStyle(backgroundColor: Colors.green)),
                ],
              ));
        } else if (_accelerator[0][1] > 0.5 &&
            _accelerator[1][1] < 0 &&
            // _accelerator[2][1] < 0 &&
            isJumping == true) {
          isJumping = false;
          sensorData.insert(
              0,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('0', style: TextStyle(backgroundColor: Colors.red)),
                  Text('0', style: TextStyle(backgroundColor: Colors.red)),
                  Text('0', style: TextStyle(backgroundColor: Colors.red)),
                ],
              ));
          widget.countJump();
          countJumps.add(1);
          if (countJumps.length == widget.counts) {
            _subscription?.cancel();
          }
        }
      },
    );
  }

  int jumps = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              _startListening();
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
            )),

        // ElevatedButton(
        //     child: const Text("Start"),
        //     onPressed: () {
        //       _startListening();
        //     }),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.red,
        //   ),
        //   onPressed: () {
        //     isJumping = false;
        //     _subscription?.cancel();
        //     setState(() {});
        //   },
        //   child: const Text("Stop"),
        // ),

        for (Widget rowData in sensorData) rowData,
      ],
    );
  }
}
