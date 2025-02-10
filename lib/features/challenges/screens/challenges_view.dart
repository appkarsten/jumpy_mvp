import 'package:flutter/material.dart';
import 'package:jumpy_mvp/features/challenges/screens/challenge_detail.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/features/challenges/widgets/challenges_card.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({required this.challenges, super.key});
  final List<Challenge> challenges;

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

// width category load categories
// with state change of category
// go to challenge starter
class _ChallengesPageState extends State<ChallengesPage> {
  String category = '';
  int counts = 0;
  double fillHeight = 0;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    if (category == '') {
      return Scaffold(
        appBar: AppBar(title: Text('Select your Challenge $category')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GridView.builder(
            itemCount: widget.challenges.length,
            // todo find out what slivergrid... is
            // just forgot
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  // set state and load challenge starter
                  setState(() {
                    category = widget.challenges[index].category;
                    counts = widget.challenges[index].counts;
                  });
                },
                child:
                    // call challenges card widget
                    ChallengesCard(challenges: widget.challenges, index: index),
              );
            },
          ),
        ),
      );
    }
    // section challenge starter
    else {
      double fillHeight = 400;
      return Scaffold(
        appBar: AppBar(
            // create go back to challenge overview
            // button
            leading: IconButton(
              onPressed: () {
                setState(() {
                  category = '';
                  _count = 0;
                });
              },
              icon: Icon(
                Icons.chevron_left_outlined,
                size: 30,
                color: AppColors.textColor,
              ),
            ),
            title: Column(
              children: [
                Text('Challenge'),
                Text('$counts $category'),
              ],
            )),
        body: ChallengeDetail(
            fillHeight: fillHeight, counts: counts, count: _count),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_count < counts) _count++;
              });
            },
            child: Text(
              '+',
              style: Theme.of(context).textTheme.headlineLarge,
            )),
      );
    }
  }
}
