import 'package:fitpad/features/calculator/models/calculator_model.dart';
import 'package:fitpad/features/calculator/widgets/calculator.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class CalculatorsScreen extends StatelessWidget {
  const CalculatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Calculators",
            style: kTextStyleHeadings,
          ),
        )),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return tile(index, context);
              },
              itemCount: CalTile.getCalData.length,
            ),
          ),
        ),
      ],
    );
  }
}

Widget tile(int index, BuildContext context) {
  return Card(
    elevation: 3,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      leading: Text(
        CalTile.getCalData[index].leading,
        style: kTextStyleHeaders.copyWith(color: blueColor),
      ),
      title: Text(
        CalTile.getCalData[index].title,
        style: kTextStyleLarge.copyWith(color: Colors.black, fontSize: 20),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Calculator(name: CalTile.getCalData[index].leading)));
      },
    ),
  );
}
