import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Map'),
        BottomNavigationBarItem(icon:Icon(Icons.compass_calibration), label: 'Directions'),
    ]);
  }
}