import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/weather_service.dart';
import 'package:jumpy_mvp/features/user_settings/widgets/toggle_settings.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_animation/weather_animation.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key, required this.repo, required this.prefs});
  final DatabaseRepository repo;
  final SharedPreferencesAsync prefs;

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  List<User> _users = [];
  User? _user;
  Map condition = {};
  // WeatherConfig sun = SunConfig(width: 10);
  WrapperScene currentWeather = WrapperScene(
    colors: [],
    children: [],
  );
  @override
  void initState() {
    super.initState();
    getUser();
    getWeather();
  }

  Future<void> getWeather() async {
    condition = await Weather.currentWeather();
    condition['icon'] = 'rain';
    switch (condition['icon']) {
      case 'clear-day':
        currentWeather = WrapperScene(
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
        currentWeather = WrapperScene(
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
        // currentWeather =
        //     WrapperScene.weather(scene: WeatherScene.rainyOvercast);
        currentWeather = const WrapperScene(
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
        currentWeather = WrapperScene(
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

    setState(() {});
  }

  Future<void> getUser() async {
    _users = await widget.repo.getUsers();
    _user = _users[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(),
          title: Text('Settings'),
        ),
        body: Stack(children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Text('hi ${widget.prefs.toString()}')),
          SizedBox(
            height: 550,
            width: double.infinity,
            child: currentWeather,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 160,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_user?.email ?? 'loading User...',
                        style: Theme.of(context).textTheme.titleMedium)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.boxBorder, width: 2),
                    ),
                    child: Column(children: [
                      ToggleSettings(title: 'Soundeffects'),
                      ToggleSettings(title: 'Daily Reminder'),
                      ToggleSettings(title: 'Motivating Messages'),
                    ]),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Choose your Power Animal',
                        style: Theme.of(context).textTheme.titleMedium)),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(children: [
                    Assets.images.powerAnimals.lama.image(height: 300),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Assets.images.powerAnimals.monkey.image(height: 145),
                        SizedBox(height: 10),
                        Assets.images.powerAnimals.penguin.image(height: 145),
                      ],
                    ),
                    Column(
                      children: [
                        Assets.images.powerAnimals.raccoon.image(height: 145),
                        SizedBox(height: 10),
                        Assets.images.powerAnimals.octopus.image(height: 145),
                      ],
                    ),
                  ]),
                )
              ],
            ),
          ),
        ]));
  }
}
