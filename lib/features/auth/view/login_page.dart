import 'package:flutter/material.dart';

// non productive code from teaching session
// with simple login fields
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Text('Einloggen', style: TextTheme.of(context).headlineMedium),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                    labelText: 'Passwort',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )),
              ),
              FilledButton(
                onPressed: null,
                child: Text('Einloggen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
