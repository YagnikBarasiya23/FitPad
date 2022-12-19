import 'package:fitpad/components/our_button.dart';
import 'package:fitpad/constants.dart';
import 'package:fitpad/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/welcomeImage.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 300),
                Text(
                  "FitPad",
                  style: kTextStyleHeaders,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 30, right: 30),
                  child: Text(
                    "with this app,you can try different types of activities ",
                    style: kTextStyleSmall,
                  ),
                ),
                Text(
                  "and choose what the most enjoyable for you",
                  style: kTextStyleSmall,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            child: mainButton(
              'Get Started',
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
