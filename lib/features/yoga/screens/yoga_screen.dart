import 'dart:convert';
import 'package:fitpad/features/yoga/screens/ontap_screen.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({super.key});

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  List getData = [];

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

  @override
  void initState() {
    getYoga();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,

        title: const Text(
          'Asans',
          style: kTextStyleHeaders,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 16),
        child: getData.isEmpty
            ? const Center(
                child: Text("Service Unavailable", style: kTextStyleHeadings),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: Column(
                      children: [
                        Card(
                          elevation: 2,
                          color: Colors.white,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('images/mainIcon.png'),
                              height: 40,
                              width: 40,
                            ),
                            title: Text(
                                '${getData[index]['sanskrit_name']}(${getData[index]['english_name']})',
                                style: kTextStyleLarge.copyWith(
                                    color: Colors.black)),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OutputScreen(
                                        name: getData[index]['sanskrit_name']),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: getData.length,
              ),
      ),
    ));
  }
}
