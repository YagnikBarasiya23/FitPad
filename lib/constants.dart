import 'package:flutter/material.dart';

const kTextStyleHeadings = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 35,
    fontWeight: FontWeight.w800,
    color: Colors.white);

const kContainerDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

const kTextStyleSmall = TextStyle(
  fontSize: 17,
  fontFamily: 'Oswald',
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kTextStyleLarge = TextStyle(
  fontSize: 20,
  fontFamily: 'Oswald',
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
const kTextStyleHeaders = TextStyle(
  fontSize: 25,
  fontFamily: 'Oswald',
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.grey,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);
const orangeColor = Color(0xFFE57944);
const blueColor = Color(0xff5568FE);
