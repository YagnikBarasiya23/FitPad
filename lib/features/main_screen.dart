
import 'package:fitpad/features/calculator/screens/calculators_screen.dart';
import 'package:fitpad/features/home/screens/home_screen.dart';
import 'package:fitpad/features/profile/screens/profile_screen.dart';
import 'package:fitpad/features/toDoList/screens/ToDolist_screen.dart';
import 'package:fitpad/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class NaviBar extends StatefulWidget {
  const NaviBar({super.key});

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.playlist_add_check), label: "ToDolist"),
    BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculators"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];

  static const List<Widget> screens = [
    HomeScreen(),
    ToDoListScreen(),
    CalculatorsScreen(),
    ProfileScreen(),
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
        children: screens,
      ),
    );
  }
}
