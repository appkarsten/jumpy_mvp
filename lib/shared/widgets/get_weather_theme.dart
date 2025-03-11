import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:weather_animation/weather_animation.dart';

class GetWeatherTheme extends StatelessWidget {
  const GetWeatherTheme({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    // if (icon.contains('night')) {
    //   icon = 'night';
    // }
    switch (icon) {
      // case icon.contains('night'):
      case 'clear-day':
        return WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 126, 178, 246),
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          children: [
            SunWidget(
              sunConfig: SunConfig(width: 190),
            ),
          ],
        );

      case 'partly-cloudy-day':
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 190, 198, 246),
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          isLeftCornerGradient: true,
          children: [
            SunWidget(
              sunConfig: SunConfig(width: 190),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(size: 60, y: 70, x: 80),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(size: 75, y: 30, x: 250),
            ),
          ],
        );
      case 'cloudy':
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 158, 169, 233),
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          isLeftCornerGradient: true,
          children: [
            CloudWidget(
              cloudConfig: CloudConfig(size: 60, y: 70),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(size: 160, y: 30, x: 150),
            ),
          ],
        );
      case 'rain':
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff424242),
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          children: [
            RainWidget(
              rainConfig: RainConfig(
                count: 30,
                lengthDrop: 13,
                widthDrop: 4,
                color: Color(0x5e9e9e9e),
                areaYStart: 145,
              ),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                size: 140,
                color: Color(0xcdbdbdbd),
                widgetCloud: null,
                x: 180,
                y: 10,
                scaleBegin: 1,
                scaleEnd: 1.1,
                slideX: 11,
                slideY: 13,
                slideDurMill: 4000,
              ),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                size: 100,
                color: Color(0x92fafafa),
                widgetCloud: null,
                x: 100,
                y: 60,
                scaleBegin: 1,
                scaleEnd: 1.08,
                slideX: 20,
                slideY: 0,
                slideDurMill: 3000,
              ),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                size: 75,
                color: Color(0xb5fafafa),
                widgetCloud: null,
                x: 160,
                y: 90,
                scaleBegin: 1,
                scaleEnd: 1.1,
                slideX: 20,
                slideY: 4,
                slideDurMill: 2000,
              ),
            ),
          ],
        );

      case String s when s.contains('night'):
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 3, 4, 11),
              Color.fromARGB(255, 32, 27, 61),
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          isLeftCornerGradient: true,
          children: [
            CloudWidget(
              cloudConfig: CloudConfig(
                size: 60,
                y: 70,
                color: Color.fromARGB(100, 100, 98, 98),
              ),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                size: 160,
                y: 30,
                x: 150,
                color: Color.fromARGB(119, 94, 93, 93),
              ),
            ),
          ],
        );

      default:
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.pink,
              AppColors.mainBackground,
              AppColors.mainBackground,
              AppColors.mainBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          children: [
            SunWidget(
              sunConfig: SunConfig(width: 150),
            ),
          ],
        );
    }
  }
}
