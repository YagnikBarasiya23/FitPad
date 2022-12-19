import 'package:fitpad/constants.dart';
import 'package:flutter/material.dart';

Widget mainButton(String text, void Function() onPressed) {
  return MaterialButton(
    elevation: 3,
    height: 50,
    minWidth: 300,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: orangeColor,
    onPressed: onPressed,
    child: Text(text, style: kTextStyleSmall),
  );
}
