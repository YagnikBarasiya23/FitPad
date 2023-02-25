import 'package:fitpad/features/calculator/widgets/gender_card.dart';
import 'package:fitpad/features/calculator/widgets/result_sheet.dart';
import 'package:fitpad/features/calculator/widgets/value_card.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:fitpad/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, this.name});
  final String? name;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late WeightSliderController _controller;
  int screenState = 0;

  double index = 0;
  double height = 130;
  int weight = 30;
  int age = 0;
  int waist = 0;
  int hip = 0;
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int value4 = 0;
  String? title1;
  String? title2;
  String? title3;
  String? title4;
  int flag = 0;
  void setScreenState() {
    if (widget.name == 'ABSI') {
      setState(() {
        screenState = 1;
      });
    } else {
      screenState = 0;
    }
  }

  void getValue() {
    if (widget.name == 'BMI' ||
        widget.name == 'BMR' ||
        widget.name == 'BFP' ||
        widget.name == 'IBW') {
      value1 = weight;
      value2 = age;
      title1 = 'Weight';
      title2 = 'Age';
    } else if (widget.name == 'WHR') {
      value1 = hip;
      value2 = waist;
      title1 = 'Hip';
      title2 = 'Waist';
    } else if (widget.name == 'ABSI') {
      value1 = weight;
      value2 = age;
      title1 = 'Weight';
      title2 = 'Age';
      value3 = hip;
      value4 = waist;
      title3 = 'Hip';
      title4 = 'Waist';
    }
  }

  @override
  void initState() {
    super.initState();
    setScreenState();
    _controller = WeightSliderController(
        initialWeight: height, minWeight: 120, interval: 0.1);
    getValue();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color maleInactiveColor = const Color(0xFF2B3C4F);
  Color femaleInactiveColor = const Color(0xFFE54C3C);
  Color maleActiveColor = Colors.blue;
  Color femaleActiveColor = const Color(0xFFFF4181);
  Color maleCardColor = const Color(0xFF2B3C4F);
  Color femaleCardColor = const Color(0xFFE54C3C);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: blueColor,
              title: Text(
                '${widget.name.toString()}' ' Calculator',
                style: kTextStyleHeaders,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        height = 130;
                        weight = 30;
                        age = 0;
                      });
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            body: SingleChildScrollView(
              physics: screenState == 0
                  ? const NeverScrollableScrollPhysics()
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 1;
                              if (maleCardColor == maleInactiveColor) {
                                maleCardColor = maleActiveColor;
                                femaleCardColor = femaleInactiveColor;
                              } else {
                                maleCardColor = maleInactiveColor;
                              }
                            });
                          },
                          child: GenderCard(
                            text: 'Male',
                            icon: const Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                            ),
                            inactiveColor: maleCardColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = 2;
                              if (femaleCardColor == femaleInactiveColor) {
                                femaleCardColor = femaleActiveColor;
                                maleCardColor = maleInactiveColor;
                              } else {
                                femaleCardColor = femaleInactiveColor;
                              }
                            });
                          },
                          child: GenderCard(
                            text: 'Female',
                            icon: const Icon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                            ),
                            inactiveColor: femaleCardColor,
                          ),
                        ),
                      ],
                    ),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: screenState == 1
                          ? [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 4,
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Height',
                                        style: kTextStyleLarge.copyWith(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "$height cm",
                                        style: kTextStyleHeaders.copyWith(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                      VerticalWeightSlider(
                                        controller: _controller,
                                        decoration: const PointerDecoration(
                                          width: 100.0,
                                          height: 3.0,
                                          largeColor: Color(0xFF898989),
                                          mediumColor: Color(0xFFC5C5C5),
                                          smallColor: Color(0xFFF0F0F0),
                                          gap: 30.0,
                                        ),
                                        onChanged: (double value) {
                                          setState(() {
                                            height = value;
                                          });
                                        },
                                        indicator: Container(
                                          height: 3.0,
                                          width: 130.0,
                                          alignment: Alignment.centerLeft,
                                          color: Colors.red[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2,
                                  child: ValueCard(
                                    value: value1,
                                    title: title1,
                                    onPressedSub: () {
                                      setState(() {
                                        value1--;
                                      });
                                    },
                                    onPressedAdd: () {
                                      setState(() {
                                        value1++;
                                      });
                                    },
                                  )),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: ValueCard(
                                  title: title2,
                                  onPressedAdd: () {
                                    setState(() {
                                      value2++;
                                    });
                                  },
                                  onPressedSub: () {
                                    setState(() {
                                      value2--;
                                    });
                                  },
                                  value: value2,
                                ),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: ValueCard(
                                    title: title3,
                                    onPressedAdd: () {
                                      setState(() {
                                        value3++;
                                      });
                                    },
                                    onPressedSub: () {
                                      setState(() {
                                        value3--;
                                      });
                                    },
                                    value: value3),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: ValueCard(
                                  onPressedSub: () {
                                    setState(() {
                                      value4--;
                                    });
                                  },
                                  onPressedAdd: () {
                                    setState(() {
                                      value4++;
                                    });
                                  },
                                  title: title4,
                                  value: value4,
                                ),
                              ),
                            ]
                          : [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 4,
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Height',
                                        style: kTextStyleLarge.copyWith(
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "$height cm",
                                        style: kTextStyleHeaders.copyWith(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                      VerticalWeightSlider(
                                        controller: _controller,
                                        decoration: const PointerDecoration(
                                          width: 100.0,
                                          height: 3.0,
                                          largeColor: Color(0xFF898989),
                                          mediumColor: Color(0xFFC5C5C5),
                                          smallColor: Color(0xFFF0F0F0),
                                          gap: 30.0,
                                        ),
                                        onChanged: (double value) {
                                          setState(() {
                                            height = value;
                                          });
                                        },
                                        indicator: Container(
                                          height: 3.0,
                                          width: 130.0,
                                          alignment: Alignment.centerLeft,
                                          color: Colors.red[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2,
                                  child: ValueCard(
                                    value: value1,
                                    title: title1,
                                    onPressedSub: () {
                                      setState(() {
                                        value1--;
                                      });
                                    },
                                    onPressedAdd: () {
                                      setState(() {
                                        value1++;
                                      });
                                    },
                                  )),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: ValueCard(
                                  title: title2,
                                  onPressedAdd: () {
                                    setState(() {
                                      value2++;
                                    });
                                  },
                                  onPressedSub: () {
                                    setState(() {
                                      value2--;
                                    });
                                  },
                                  value: value2,
                                ),
                              ),
                            ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomButton(
                          text: 'Calculate',
                          onPressed: () {
                            showModalBottomSheet(
                              elevation: 5,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              backgroundColor: blueColor,
                              context: context,
                              builder: (context) => ResultSheet(
                                height: height,
                                weight: value1,
                                name: widget.name,
                                flag: flag,
                                age: value2,
                                hip: hip,
                                waist: waist,
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ),
            )));
  }
}
