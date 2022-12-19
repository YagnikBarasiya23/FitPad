import 'package:fitpad/constants.dart';

import 'package:fitpad/screens/hybrid/hybrid_screen.dart';
import 'package:fitpad/screens/running/running_screen.dart';
import 'package:fitpad/screens/yoga/yoga_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(text: 'Fit', style: kTextStyleHeadings),
                  TextSpan(
                      text: 'Pad',
                      style: kTextStyleHeadings.copyWith(color: blueColor))
                ])),
              ),
              const SizedBox(height: 30),
              const Text(
                'Activities',
                style: kTextStyleHeadings,
              ),
              const SizedBox(height: 10),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HybridScreen(flag: 1),
                              ));
                        },
                        child: cardTile(2, 'CROSSFIT')),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RunningScreen(),
                              ));
                        },
                        child: cardTile(0, 'RUNNING')),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 4,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YogaScreen(),
                              ));
                        },
                        child: cardTile(1, 'YOGA')),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HybridScreen(flag: 0),
                              ));
                        },
                        child: cardTile(3, 'GYM')),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget cardTile(int index, String text) {
  return Card(
    elevation: 3,
    color: Colors.transparent,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      decoration: kContainerDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage('images/a$index.jpg'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: kTextStyleHeaders.copyWith(color: Colors.white))
          ],
        ),
      ),
    ),
  );
}