import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/ranking/widgets/ranking_from_four.dart';
import 'package:jumpy_mvp/features/ranking/widgets/ranking_top.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class Ranking extends StatelessWidget {
  const Ranking({required this.users, super.key});
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highscore Ranking'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 3; i++) RankingTop(users: users, i: i)
              ],
            ),
            Spacer(),
            SizedBox(
              height: 450,
              child: ListView(children: [
                for (int i = 3; i < users.length; i++)
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.textColor
                                      .withValues(alpha: 0.2)))),
                      height: 70,
                      child: RankingFromFour(users: users, i: i))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
