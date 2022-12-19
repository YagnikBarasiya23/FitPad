import 'dart:convert';
import 'package:fitpad/constants.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class OutputScreen extends StatefulWidget {
  OutputScreen({this.name});
  String? name;
  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  List getData = [];
  int count = 0;
  Future getYoga() async {
    var url = "https://lightning-yoga-api.herokuapp.com/yoga_poses";

    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        Map decodeData = json.decode(response.body);
        getData = decodeData['items'];
      });
    } else {
      print(response.statusCode);
    }
  }

  void setFunction() {
    for (int i = 0; i < 48; i++) {
      if (widget.name == getData[i]['sanskrit_name']) {
        count = i;
      }
    }
  }

  @override
  void initState() {
    getYoga();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      setFunction();
    } catch (e) {
      print(e);
    }
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          widget.name.toString(),
          style: kTextStyleHeaders,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${getData[count]['yoga_categories'][index]['name']} :-',
                        style: kTextStyleLarge.copyWith(
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 5),
                    Text(
                        getData[count]['yoga_categories'][index]['description'],
                        style: kTextStyleSmall),
                  ],
                ),
              ),
            );
          },
          itemCount: getData[count]['yoga_categories'].length,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    ));
  }
}
