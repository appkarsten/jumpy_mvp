import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jumpy_mvp/models/user.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class RankingFromFour extends StatelessWidget {
  const RankingFromFour({
    super.key,
    required this.users,
    required this.i,
  });

  final List<User> users;
  final int i;

  @override
  Widget build(BuildContext context) {
    Random r = Random();
    bool result = r.nextDouble() <= 0.7;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 6,
            children: [
              Text(
                (i + 1).toString(),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage:
                    AssetImage('assets/images/users/user_${i + 1}.jpg'),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(users[i].name,
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          ),
          result == true
              ? Icon(
                  Icons.watch_outlined,
                  size: 16,
                  color: AppColors.textColor,
                )
              : Icon(
                  Icons.smartphone_outlined,
                  size: 16,
                  color: AppColors.textColor,
                ),
        ],
      ),
    );
    // return ListTile(
    //   leading: CircleAvatar(
    //     radius: 25,
    //     backgroundImage: AssetImage('assets/images/users/user_${i + 1}.jpg'),
    //   ),
    //   title: Text(users[i].name, style: Theme.of(context).textTheme.titleSmall),
    //   trailing: result == true
    //       ? Icon(
    //           Icons.watch_outlined,
    //           size: 16,
    //           color: AppColors.textColor,
    //         )
    //       : Icon(
    //           Icons.smartphone_outlined,
    //           size: 16,
    //           color: AppColors.textColor,
    //         ),
    // );
  }
}
