import 'package:flutter/material.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ToggleSettings extends StatefulWidget {
  const ToggleSettings({super.key, required this.title});
  final String title;

  @override
  State<ToggleSettings> createState() => _ToggleSettingsState();
}

class _ToggleSettingsState extends State<ToggleSettings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          Switch.adaptive(
              value: true,
              activeColor: AppColors.accentColor,
              onChanged: (value) => setState(() {
                    value = value;
                  })),
        ],
      ),
    );
  }
}
