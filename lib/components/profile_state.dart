// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fitpad/constants.dart';
import 'package:fitpad/screens/reset_password_screen.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileState extends StatefulWidget {
  @override
  State<ProfileState> createState() => _ProfileStateState();
}

class _ProfileStateState extends State<ProfileState> {
  urlLaunch(Uri url) async {
    try {
      if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
        print('could not reach');
      }
    } catch (e) {
      print(e);
    }
  }

  String? userName;
  late DatabaseReference _databaseReference;

  void setName() {
    _databaseReference
        .child("Information")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child("UserName")
        .once()
        .then((databaseEvent) {
      setState(() {
        userName = databaseEvent.snapshot.value.toString();
      });
    });
  }

  @override
  void initState() {
    _databaseReference = FirebaseDatabase.instance.reference();
    setName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 7),
          Text(userName.toString(), style: kTextStyleHeaders),
          const SizedBox(height: 60),
          profileTile(
              Icons.lock_reset,
              'Change Password',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
                  ))),
          profileTile(Icons.safety_check, 'Terms and Conditions', () {
            Uri url =
                Uri.parse('https://pages.flycricket.io/fitpad/terms.html');
            urlLaunch(url);
          }),
          profileTile(Icons.privacy_tip, 'Privacy Policy', () {
            Uri url =
                Uri.parse('https://pages.flycricket.io/fitpad/privacy.html');
            urlLaunch(url);
          }),
          profileTile(Icons.feedback, 'Feedback', () {}),
          Row(
            children: [
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Container(
                  decoration: kContainerDecoration,
                  width: 100,
                  height: 50,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      Text(' Sign Out',
                          style: kTextStyleLarge.copyWith(
                              fontWeight: FontWeight.bold, color: blueColor))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget profileTile(IconData icon, String text, Function() onTap) {
  return Card(
    elevation: 3,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      leading: Icon(icon, color: blueColor, size: 30),
      title: Text(
        text,
        style: kTextStyleLarge.copyWith(color: Colors.black),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Colors.black),
      onTap: onTap,
    ),
  );
}
