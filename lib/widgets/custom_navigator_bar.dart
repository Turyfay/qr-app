import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = 1;


    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      items: const  [
        BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Map'),
        BottomNavigationBarItem(icon:Icon(Icons.compass_calibration), label: 'Directions'),
    ]);
  }
}