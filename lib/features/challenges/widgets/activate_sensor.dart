import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/data/accelerometer_data.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:jumpy_mvp/features/challenges/data/gyroscope_data.dart';

class ActivateSensor extends StatefulWidget {
  const ActivateSensor({super.key});

  @override
  State<ActivateSensor> createState() => _ActivateSensorState();
}

class _ActivateSensorState extends State<ActivateSensor> {
  List<double>? _accelerometerValues;
  List<double>? _userAccelerometerValues;
  List<double>? _gyroscopeValues;
  List<double>? _magnetometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  List<AccelerometerData> _accelerometerData = [];
  List<GyroscopeData> _gyroscopeData = [];
  String jumps = 'start jumping';

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        .toList();
    final magnetometer =
        _magnetometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Column(
      children: [
        ElevatedButton(
            child: const Text("Start"),
            onPressed: () {
              _accelerometerData.clear();
              _gyroscopeData.clear();
              // start a stream that saves acceleroemeterData
              _streamSubscriptions
                  .add(accelerometerEvents.listen((AccelerometerEvent event) {
                _accelerometerData.add(AccelerometerData(
                    DateTime.now(), <double>[event.x, event.y, event.z]));
              }));
              _streamSubscriptions
                  .add(gyroscopeEvents.listen((GyroscopeEvent event) {
                _gyroscopeData.add(GyroscopeData(
                    DateTime.now(), <double>[event.x, event.y, event.z]));
              }));
            }),
        ElevatedButton(
          child: const Text("Stop"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            print("length: ${_accelerometerData.length}");
            jumps = _accelerometerData.toString();
            setState(() {});
          },
        ),
        Text('Data: $jumps'),
      ],
    );
  }
}
