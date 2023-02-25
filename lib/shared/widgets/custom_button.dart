
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
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
}
