import 'package:flutter/material.dart';
import 'package:jumpy_mvp/jumpy_app.dart';
import 'package:jumpy_mvp/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      home: JumpyApp(),
    );
  }
}
