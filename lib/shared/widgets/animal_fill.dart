import 'package:flutter/material.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

// creating power animal with given height
// and backgrond filling height
class AnimalFill extends StatelessWidget {
  const AnimalFill({
    super.key,
    required this.fillHeight,
    required this.llamaHeight,
  });

  final double fillHeight;
  final double llamaHeight;

  @override
  Widget build(BuildContext context) {
    final Image image =
        Assets.images.powerAnimals.lama.image(height: llamaHeight);

    return Stack(children: [
      Positioned(
        bottom: 0,
        left: 0,
        child: Container(
            height: fillHeight,
            width: 400,
            decoration: BoxDecoration(color: AppColors.animalColor)),
      ),
      image,
    ]);
  }
}
