import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/auth/view/second_screen.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/models/user.dart';

// non productive code from teaching session
// with simple login fields
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.users, required this.challenges});
  final List<User> users;
  final List<Challenge> challenges;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  final List<int> numbers = [1, 13, 543, 2, 43, 5];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrate'),
        ),
        body: Column(
          children: [
            Text((numbers.reduce((a, b) => a + b) / numbers.length)
                .toStringAsFixed(2)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    Text('Create Account',
                        style: TextTheme.of(context).headlineMedium),
                    TextFormField(
                      controller: nicknameController,
                      decoration: InputDecoration(
                        labelText: 'Nickname',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        final pattern =
                            RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-\[\]]');
                        final v = value ?? '@';
                        if (pattern.hasMatch(v) || v.length < 5) {
                          return 'min 5 character, no specials';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          final pattern = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (pattern.hasMatch(value ?? '')) {
                            return null;
                          } else {
                            return 'keine korrekte email';
                          }
                        }),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      validator: (value) {
                        return (value?.length ?? 0) > 7
                            ? null
                            : 'Passwort muss mindestens 8 Zeichen lang sein';
                      },
                      decoration: InputDecoration(
                          labelText: 'Passwort',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                    ),
                    FilledButton(
                      onPressed: () {
                        // hole den wert von email und passwort
                        final email = emailController.text;
                        final password = passwordController.text;
                        final nickname = nicknameController.text;

                        if (_formKey.currentState!.validate()) {
                          nicknameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                nickname: nickname,
                                email: email,
                                password: password,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text('create'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
