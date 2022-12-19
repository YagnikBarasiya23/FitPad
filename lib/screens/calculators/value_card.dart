import 'package:fitpad/constants.dart';
import 'package:flutter/material.dart';

class ValueCard extends StatelessWidget {
  ValueCard({this.value, this.title, this.onPressedAdd, this.onPressedSub});
  String? title;
  int? value;
  Function()? onPressedAdd;
  Function()? onPressedSub;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title.toString(),
              style: kTextStyleLarge.copyWith(color: Colors.black)),
          Text('$value',
              style: kTextStyleHeadings.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onPressedAdd,
                child: const Icon(
                  Icons.add_circle,
                  color: orangeColor,
                  size: 40,
                ),
              ),
              GestureDetector(
                onTap: onPressedSub,
                child: const Icon(
                  Icons.remove_circle,
                  color: orangeColor,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
