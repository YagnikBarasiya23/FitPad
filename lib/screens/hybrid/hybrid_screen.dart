import 'package:fitpad/constants.dart';
import 'package:fitpad/models/difficulty_model.dart';
import 'package:fitpad/models/muscles_model.dart';
import 'package:fitpad/models/types_model.dart';
import 'package:fitpad/screens/hybrid/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HybridScreen extends StatefulWidget {
  HybridScreen({this.flag});
  int? flag;
  @override
  State<HybridScreen> createState() => _HybridScreenState();
}

class _HybridScreenState extends State<HybridScreen> {
  String? muscle;
  String? crossfit;
  int screenState = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,

          title: Text(
            widget.flag == 0 ? 'Gym' : 'Crossfit',
            style: kTextStyleHeaders,
          ),
        ),
        body: screenState == 1
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return difficultyTile(
                          index,
                          () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListScreen(
                                    crossfit: crossfit,
                                    level: DifficultyModel
                                        .getDifficultyData[index].level,
                                    muscle: muscle),
                              )));
                    },
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                  ),
                ),
              )
            : widget.flag == 0
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 35, right: 35, bottom: 20, top: 28),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return gymTile(
                          index,
                          () {
                            setState(() {
                              screenState = 1;
                              muscle = MusclesModel.getMusclesData[index].name;
                            });
                          },
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: MusclesModel.getMusclesData.length,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return crossfitTile(index, () {
                          setState(() {
                            screenState = 1;
                            crossfit =
                                CrossfitModel.getCrossfitData[index].name;
                          });
                        });
                      },
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
      ),
    );
  }
}

Widget gymTile(int index, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.grey,
      elevation: 3,
      color: Colors.transparent,
      child: Container(
        decoration: kContainerDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage('images/ms$index.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MusclesModel.getMusclesData[index].name,
                  style: kTextStyleHeaders.copyWith(
                      color: Colors.white, fontSize: 20))
            ],
          ),
        ),
      ),
    ),
  );
}

Widget difficultyTile(int index, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      color: Colors.transparent,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 300,
        height: 200,
        decoration: kContainerDecoration.copyWith(
            image: DecorationImage(
                image: AssetImage('images/d$index.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar.builder(
                itemCount: 5,
                allowHalfRating: true,
                itemSize: 30,
                ignoreGestures: true,
                unratedColor: Colors.white,
                initialRating: DifficultyModel.getDifficultyData[index].rating,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Color(0xFFE21414),
                  );
                },
                onRatingUpdate: (value) {},
              ),
              Text(DifficultyModel.getDifficultyData[index].level,
                  style: kTextStyleHeaders.copyWith(
                      color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget crossfitTile(int index, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      color: Colors.transparent,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 150,
        width: 300,
        decoration: kContainerDecoration.copyWith(
            image: DecorationImage(
                image: AssetImage('images/t$index.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(CrossfitModel.getCrossfitData[index].name,
                  style: kTextStyleHeaders.copyWith(
                      color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    ),
  );
}
