import 'package:fitpad/components/ToDolist_state.dart';
import 'package:fitpad/components/calculators_state.dart';
import 'package:fitpad/components/home_state.dart';
import 'package:fitpad/components/profile_state.dart';
import 'package:fitpad/constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.playlist_add_check), label: "ToDolist"),
    BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculators"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];

  List<Widget> states = [
    HomeState(),
    ToDoListState(),
    CalculatorsState(),
    ProfileState(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: orangeColor,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        backgroundColor: Colors.grey.shade200,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: states,
      ),
    );
  }
}
