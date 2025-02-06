import 'package:flutter/material.dart';
import 'package:jumpy_mvp/models/user.dart';

class RankingTop extends StatelessWidget {
  const RankingTop({
    super.key,
    required this.users,
    required this.i,
  });

  final List<User> users;
  final int i;

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ['2nd', '1st', '3rd'];
    return Container(
        width: 110,
        child: Column(
          children: [
            i == 1 ? SizedBox(height: 0) : SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: i == 1
                    ? Text(titles[i],
                        style: Theme.of(context).textTheme.headlineMedium)
                    : Text(titles[i],
                        style: Theme.of(context).textTheme.headlineSmall)),
            CircleAvatar(
              radius: i == 1 ? 50 : 42,
              backgroundImage:
                  AssetImage('assets/images/users/user_${i + 1}.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(users[i].name,
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ),
          ],
        ));
  }
}
