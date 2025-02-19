import 'package:flutter/material.dart';
import 'package:jumpy_mvp/data/database_repository.dart';
import 'package:jumpy_mvp/features/challenges/screens/challenge_detail.dart';
import 'package:jumpy_mvp/features/challenges/widgets/challenges_card.dart';
import 'package:jumpy_mvp/models/challenge.dart';
import 'package:jumpy_mvp/theme/app_colors.dart';

class ChallengesPage extends StatefulWidget {
  const ChallengesPage({required this.repo, super.key});
  final DatabaseRepository repo;

  @override
  State<ChallengesPage> createState() => _ChallengesPageState();
}

// width category load categories
// with state change of category
// go to challenge starter
class _ChallengesPageState extends State<ChallengesPage> {
  List<Challenge> getAllChallenge = [];
  Future<List<Challenge>> getAllChallenges() async {
    return await widget.repo.getChallenges();
  }

  String category = '';
  int counts = 0;
  double fillHeight = 0;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    if (category == '') {
      return Scaffold(
        appBar: AppBar(title: Text('Select your Challenge $category')),
        body: FutureBuilder(
            future: getAllChallenges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Challenge>? challenges = snapshot.data;
                if (challenges == null) {
                  return Text('No Challenges');
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: GridView.builder(
                      itemCount: challenges.length,
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
                              category = challenges[index].category;
                              counts = challenges[index].counts;
                            });
                          },
                          child:
                              // call challenges card widget
                              ChallengesCard(
                                  challenges: challenges, index: index),
                        );
                      },
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
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
