import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/shared_database_repository.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ToggleSettings extends StatefulWidget {
  const ToggleSettings({
    super.key,
    required this.title,
    required this.isTrue,
    required this.prefs,
    required this.settings,
  });
  final SharedDatabaseRepository prefs;
  final Map<String, dynamic> settings;
  final String title;
  final bool isTrue;

  @override
  State<ToggleSettings> createState() => _ToggleSettingsState();
}

class _ToggleSettingsState extends State<ToggleSettings> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    isSwitched = widget.settings[widget.title] ?? true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          Switch.adaptive(
            value: isSwitched,
            activeColor: AppColors.accentColor,
            onChanged: (value) async {
              widget.settings[widget.title] = value;
              await widget.prefs.saveSettings(widget.settings);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
