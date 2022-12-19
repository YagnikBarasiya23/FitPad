import 'package:fitpad/constants.dart';

import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({
    required this.text,
    required this.icon,
    required this.inactiveColor,
  });
  String text;
  Icon icon;
  Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: kContainerDecoration.copyWith(color: inactiveColor),
        width: 160,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              Text(
                text,
                style:
                    kTextStyleLarge.copyWith(color: Colors.white, fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
