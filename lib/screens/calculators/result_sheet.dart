import 'dart:math';

import 'package:fitpad/constants.dart';
import 'package:flutter/material.dart';

class ResultSheet extends StatelessWidget {
  ResultSheet(
      {this.height,
      this.weight,
      this.name,
      required this.flag,
      this.age,
      this.hip,
      this.waist});
  double? height = 0;
  int? weight = 0;
  int? age = 0;
  double sum = 0;
  String report = 'Normal';
  int? hip = 0;
  int? waist = 0;
  String? name;
  int flag = 0;
  void result() {
    if (name == 'BMI') {
      sum = weight! / pow(height! / 100, 2);
    } else if (name == 'BMR' && flag == 1) {
      sum = 66 + (13.7 * weight!) + (5 * height!) - (6.8 * age!);
    } else if (name == 'BMR' && flag == 2) {
      sum = 655 + (9.6 * weight!) + (1.8 * height!) - (4.7 * age!);
    } else if (name == 'BFP' && flag == 1) {
      sum = (1.2 * (weight! / pow(height! / 100, 2))) +
          (0.23 * age!) -
          (10.8 * 1) -
          0.54;
    } else if (name == 'BFP' && flag == 2) {
      sum = (1.2 * (weight! / pow(height! / 100, 2))) +
          (0.23 * age!) -
          (10.8 * 0) -
          0.54;
    } else if (name == 'IBW' && flag == 1) {
      sum = 50 + ((0.91 * height!) - 152.4);
    } else if (name == 'IBW' && flag == 2) {
      sum = 45.5 + ((0.91 * height!) - 152.4);
    } else if (name == 'WHR') {
      sum = age! / weight!;
    } else if (name == 'ABSI') {
      sum = waist! /
          pow((weight! / pow(height! / 100, 2)), 0.6) *
          pow(height!, 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    result();
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your $name is',
              style: kTextStyleSmall.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              sum.toStringAsFixed(1),
              style: kTextStyleHeadings.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
