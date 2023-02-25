import 'package:fitpad/features/exercise/models/difficulty_model.dart';
import 'package:fitpad/features/exercise/models/muscles_model.dart';
import 'package:fitpad/features/exercise/models/types_model.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key, this.muscle, this.level, this.name, this.crossfit});
  final String? muscle;
  final String? level;
  final String? name;
  final String? crossfit;
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
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
  String? naam;
  String? equipment;
  String? instructions;

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

  void workout() {
    if (widget.name == decodeData[0]['name']) {
      naam = decodeData[0]['name'];
      equipment = decodeData[0]['equipment'];
      instructions = decodeData[0]['instructions'];
    } else if (widget.name == decodeData[1]['name']) {
      naam = decodeData[1]['name'];
      equipment = decodeData[1]['equipment'];
      instructions = decodeData[1]['instructions'];
    } else if (widget.name == decodeData[2]['name']) {
      naam = decodeData[2]['name'];
      equipment = decodeData[2]['equipment'];
      instructions = decodeData[2]['instructions'];
    } else if (widget.name == decodeData[3]['name']) {
      naam = decodeData[3]['name'];
      equipment = decodeData[3]['equipment'];
      instructions = decodeData[3]['instructions'];
    } else if (widget.name == decodeData[4]['name']) {
      naam = decodeData[4]['name'];
      equipment = decodeData[4]['equipment'];
      instructions = decodeData[4]['instructions'];
    } else if (widget.name == decodeData[5]['name']) {
      naam = decodeData[5]['name'];
      equipment = decodeData[5]['equipment'];
      instructions = decodeData[5]['instructions'];
    } else if (widget.name == decodeData[6]['name']) {
      naam = decodeData[6]['name'];
      equipment = decodeData[6]['equipment'];
      instructions = decodeData[6]['instructions'];
    } else if (widget.name == decodeData[7]['name']) {
      naam = decodeData[7]['name'];
      equipment = decodeData[7]['equipment'];
      instructions = decodeData[7]['instructions'];
    } else if (widget.name == decodeData[8]['name']) {
      naam = decodeData[8]['name'];
      equipment = decodeData[8]['equipment'];
      instructions = decodeData[8]['instructions'];
    } else if (widget.name == decodeData[9]['name']) {
      naam = decodeData[9]['name'];
      equipment = decodeData[9]['equipment'];
      instructions = decodeData[9]['instructions'];
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
    try {
      workout();
    } catch (e) {
      print(e);
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(widget.name.toString(), style: kTextStyleHeaders),
      ),
      body: naam == null
          ? const Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('images/mainIcon.png'),
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                    Text(naam.toString(), style: kTextStyleHeaders),
                    Text(equipment.toString(), style: kTextStyleLarge),
                    const SizedBox(height: 20),
                    Text(instructions.toString(), style: kTextStyleSmall),
                  ],
                ),
              ),
            ),
    ));
  }
}
