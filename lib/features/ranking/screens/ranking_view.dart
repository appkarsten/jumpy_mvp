import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/features/ranking/widgets/ranking_from_four.dart';
import 'package:jumpy_mvp/features/ranking/widgets/ranking_top.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

// formats any user list with 2 designs
// winners (first 3) in a header vieew
// the rest as scrollable list
class Ranking extends StatelessWidget {
  const Ranking({required this.repo, super.key});
  final DatabaseRepository repo;

  Future<List<User>?> _getAllUser() async {
    return await repo.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highscore Ranking'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.settings))],
      ),
      body: FutureBuilder(
          future: _getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<User>? users = snapshot.data;
              if (users == null) {
                return Text('No Users');
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // call ranking top from ranking widgets
                          for (int i = 0; i < 3; i++)
                            RankingTop(users: users, i: i)
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
                                // call widget ranking from for from ranking widgets
                                child: RankingFromFour(users: users, i: i))
                        ]),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
