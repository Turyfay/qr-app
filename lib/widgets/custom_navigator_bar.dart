import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;


    return BottomNavigationBar(
      onTap: (value) => {
        uiProvider.selectMenuOpt = value,
      },
      currentIndex: currentIndex,
      elevation: 0,
      items: const  [
        BottomNavigationBarItem(

          icon: Icon(Icons.map),
          label: 'Map'
          ),
        BottomNavigationBarItem(
          icon:Icon(Icons.compass_calibration), 
          label: 'Directions'
          ),
    ]);
  }
}