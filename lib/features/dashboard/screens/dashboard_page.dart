import 'package:flutter/material.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('See whats up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.boxBorder, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      height: 56,
                      width: 150,
                      decoration: BoxDecoration(color: AppColors.animalColor)),
                ),
                Assets.images.powerAnimals.llama.svg(height: 350),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('423'),
                  Text('von'),
                  Text('1000'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
