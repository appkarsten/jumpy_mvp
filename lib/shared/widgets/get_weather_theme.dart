import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';

class GetWeatherTheme extends StatelessWidget {
  const GetWeatherTheme({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    switch (icon) {
      case 'clear-day':
        return WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 126, 178, 246),
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
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

      case 'partly-cloudy-day':
        return const WrapperScene(
          colors: [
            Color.fromARGB(255, 190, 198, 246),
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
          ],
          isLeftCornerGradient: true,
          children: [
            SunWidget(
              sunConfig: SunConfig(width: 250),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(size: 60, y: 70),
            ),
            CloudWidget(),
          ],
        );
      case 'rain':
        return const WrapperScene(
          colors: [],
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff424242),
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
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
                  icon: IconData(63056, fontFamily: 'MaterialIcons'),
                  widgetCloud: null,
                  x: 180,
                  y: 10,
                  scaleBegin: 1,
                  scaleEnd: 1.1,
                  scaleCurve: Cubic(0.40, 0.00, 0.20, 1.00),
                  slideX: 11,
                  slideY: 13,
                  slideDurMill: 4000,
                  slideCurve: Cubic(0.40, 0.00, 0.20, 1.00)),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                  size: 100,
                  color: Color(0x92fafafa),
                  icon: IconData(63056, fontFamily: 'MaterialIcons'),
                  widgetCloud: null,
                  x: 100,
                  y: 60,
                  scaleBegin: 1,
                  scaleEnd: 1.08,
                  scaleCurve: Cubic(0.40, 0.00, 0.20, 1.00),
                  slideX: 20,
                  slideY: 0,
                  slideDurMill: 3000,
                  slideCurve: Cubic(0.40, 0.00, 0.20, 1.00)),
            ),
            CloudWidget(
              cloudConfig: CloudConfig(
                  size: 75,
                  color: Color(0xb5fafafa),
                  icon: IconData(63056, fontFamily: 'MaterialIcons'),
                  widgetCloud: null,
                  x: 160,
                  y: 90,
                  scaleBegin: 1,
                  scaleEnd: 1.1,
                  scaleCurve: Cubic(0.40, 0.00, 0.20, 1.00),
                  slideX: 20,
                  slideY: 4,
                  slideDurMill: 2000,
                  slideCurve: Cubic(0.40, 0.00, 0.20, 1.00)),
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
              Colors.transparent,
              Colors.transparent,
              Colors.transparent
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
