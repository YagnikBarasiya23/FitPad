import 'package:fitpad/constants.dart';
import 'package:fitpad/models/difficulty_model.dart';
import 'package:fitpad/models/muscles_model.dart';
import 'package:fitpad/models/types_model.dart';
import 'package:fitpad/screens/hybrid/workout_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ListScreen extends StatefulWidget {
  ListScreen({this.muscle, this.level, this.crossfit});
  final String? muscle;
  final String? level;
  final String? crossfit;
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final String muscles;
  late final String difficulty;
  late final String type;
  int flag = 0;
  void beginner() {
    if (widget.muscle == MusclesModel.getMusclesData[0].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'biceps';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[1].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'forearms';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[2].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'chest';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[3].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'abdominals';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[4].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'hamstrings';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[5].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'lats';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[6].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'traps';
      difficulty = 'beginner';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[7].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'triceps';
      difficulty = 'beginner';
      flag = 1;
    }
  }

  void intermediate() {
    if (widget.muscle == MusclesModel.getMusclesData[0].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'biceps';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[1].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'forearms';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[2].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'chest';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[3].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'abdominals';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[4].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'hamstrings';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[5].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'lats';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[6].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'traps';
      difficulty = 'intermediate';
      flag = 1;
    } else if (widget.muscle == MusclesModel.getMusclesData[7].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'triceps';
      difficulty = 'intermediate';
      flag = 1;
    }
  }

  void beginner1() {
    if (widget.crossfit == CrossfitModel.getCrossfitData[0].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      type = 'stretching';
      difficulty = 'beginner';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[1].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      type = 'plyometrics';
      difficulty = 'beginner';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[2].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      type = 'cardio';
      difficulty = 'beginner';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[3].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      type = 'powerlifting';
      difficulty = 'beginner';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[4].name &&
        widget.level == DifficultyModel.getDifficultyData[0].level) {
      type = 'strength';
      difficulty = 'beginner';
      flag = 0;
    }
  }

  void intermediate1() {
    if (widget.crossfit == CrossfitModel.getCrossfitData[0].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      type = 'stretching';
      difficulty = 'intermediate';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[1].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      type = 'plyometrics';
      difficulty = 'intermediate';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[2].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      type = 'cardio';
      difficulty = 'intermediate';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[3].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      type = 'powerlifting';
      difficulty = 'intermediate';
      flag = 0;
    } else if (widget.crossfit == CrossfitModel.getCrossfitData[4].name &&
        widget.level == DifficultyModel.getDifficultyData[1].level) {
      type = 'strength';
      difficulty = 'intermediate';
      flag = 0;
    }
  }

  List decodeData = [];

  Future getWorkout() async {
    var url =
        "https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises?${flag == 0 ? 'type' : 'muscle'}=${flag == 0 ? type : muscles}&difficulty=$difficulty";
    final headers = {
      'X-RapidAPI-Key': "8963005d09msh043f84b9a7c9cd8p1761dejsn83d9562938be",
      'X-RapidAPI-Host': "exercises-by-api-ninjas.p.rapidapi.com",
    };
    Response response = await get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        decodeData = json.decode(response.body);
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    beginner();
    intermediate();
    beginner1();
    intermediate1();
    getWorkout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE57944),
        title: Text(
          'Exercises',
          style: kTextStyleHeaders,
        ),
      ),
      body: widget.level == DifficultyModel.getDifficultyData[2].level
          ? const Center(
              child: Text('No Data', style: kTextStyleHeadings),
            )
          : Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 16),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('images/mainIcon.png'),
                              height: 40,
                              width: 40,
                            ),
                            title: Text(decodeData[index]['name'],
                                style: kTextStyleLarge.copyWith(
                                    color: Colors.black)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutScreen(
                                      muscle: widget.muscle,
                                      level: widget.level,
                                      name: decodeData[index]['name'],
                                      crossfit: widget.crossfit,
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: decodeData.length,
              ),
            ),
    ));
  }
}
