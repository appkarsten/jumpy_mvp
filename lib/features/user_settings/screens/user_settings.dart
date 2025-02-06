import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/user_settings/widgets/toggle_settings.dart';
import 'package:jumpy_mvp/gen/assets.gen.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({super.key, required this.users});
  final List<User> users;

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    User user = widget.users[0];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(user.email,
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
    );
  }
}
