import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/data/shared_database_repository.dart';
import 'package:jumpy_mvp/data/weather_service.dart';
import 'package:jumpy_mvp/features/user_settings/widgets/toggle_settings.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/shared/widgets/get_weather_theme.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';
import 'package:weather_animation/weather_animation.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key, required this.repo, required this.prefs});
  final DatabaseRepository repo;
  final SharedDatabaseRepository prefs;

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  Map<String, dynamic> settings = {};
  List<User> _users = [];
  User? _user;
  Map condition = {};
  final String _key = 'settings';
  // WeatherConfig sun = SunConfig(width: 10);
  Widget currentWeather = WrapperScene(colors: [], children: []);
  @override
  void initState() {
    super.initState();
    getUser();
    _updateSettings();
  }

  Future<void> _updateSettings() async {
    //TODO set initial userSetting during onboarding
    final Map<String, dynamic> _newSetting = {
      'location': 'Berlin',
      'Soundeffects': false,
      'Daily Reminder': true,
      'Motivating Messages': false
    };
    // await widget.prefs.saveSettings(_newSetting);

    settings = jsonDecode(await widget.prefs.getSettings());
    print(settings['location']);
    getWeather();
    setState(() {});
  }

  Future<void> getWeather() async {
    condition = await Weather.currentWeather(settings['location']);
    //condition = {'icon': 'cloudy'};
    currentWeather = GetWeatherTheme(icon: condition['icon']);
    setState(() {});
  }

  Future<void> getUser() async {
    _users = await widget.repo.getUsers();
    _user = _users[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController location = TextEditingController(
        text: settings.isEmpty ? 'Location' : settings['location']);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(),
          title: Text('Settings'),
        ),
        body: Stack(children: [
          SizedBox(
            height: 550,
            width: double.infinity,
            child: currentWeather,
          ),
          Positioned(
              top: 120,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  settings.isEmpty
                      ? Text('loading...')
                      : Text(settings['location']),
                  SizedBox(
                    child: Text(
                      '${condition['temp'].toString()} °C',
                    ),
                    // style: Theme.of(context).textTheme.titleMedium),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
              top: 160,
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(_user?.email ?? 'loading User...',
                        style: Theme.of(context).textTheme.titleMedium)),
                Spacer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 220,
                            child: TextFormField(
                              controller: location,
                              onTap: () => location.clear(),
                              onFieldSubmitted: (newValue) async {
                                if (formKey.currentState!.validate()) {
                                  settings['location'] = location.value.text;
                                  await widget.prefs.saveSettings(settings);
                                  await _updateSettings();
                                }
                              },

                              // settings.isEmpty ? '' : settings[0]),
                              decoration: const InputDecoration(
                                label: Text('Location'),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Location';
                                }
                                return null;
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                settings['location'] = location.value.text;
                                await widget.prefs.saveSettings(settings);
                                print(settings);
                                await _updateSettings();
                              }
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.boxBorder, width: 2),
                          ),
                          child: Column(children: [
                            ToggleSettings(
                                prefs: widget.prefs,
                                settings: settings.isEmpty ? {} : settings,
                                title: 'Soundeffects',
                                isTrue: settings.isEmpty
                                    ? true
                                    : settings['Soundeffects']),
                            ToggleSettings(
                                prefs: widget.prefs,
                                settings: settings.isEmpty ? {} : settings,
                                title: 'Daily Reminder',
                                isTrue: settings.isEmpty
                                    ? false
                                    : settings['Daily Reminder']),
                            ToggleSettings(
                                prefs: widget.prefs,
                                settings: settings.isEmpty ? {} : settings,
                                title: 'Motivating Messages',
                                isTrue: settings.isEmpty
                                    ? false
                                    : settings['Motivating Messages']),
                          ]),
                        ),
                      ),
                    ],
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
