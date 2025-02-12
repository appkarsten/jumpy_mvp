import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
      {super.key,
      required this.email,
      required this.nickname,
      required this.password});
  final String email;
  final String nickname;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Onboarding Second Page')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(leading: Text('Nickname'), title: Text(nickname)),
              ListTile(leading: Text('Email'), title: Text(email)),
              ListTile(leading: Text('Password'), title: Text(password)),
            ],
          ),
        ));
  }
}
