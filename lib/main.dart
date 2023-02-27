import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitpad/features/main_screen.dart';
import 'package:fitpad/features/toDoList/models/toDoList_model.dart';
import 'package:fitpad/features/welcome/screens/welcome_screen.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const FitPad());
}

class FitPad extends StatelessWidget {
  const FitPad({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff181920),
           ),
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: blueColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Container(
              color: Colors.black26,
              width: double.maxFinite,
              height: double.maxFinite,
              child: const Text(
                "Something went wrong",
                style: kTextStyleHeadings,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return const NaviBar();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}
