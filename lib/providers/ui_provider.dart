import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectMenuOpt = 1;

  int get selectMenuOpt => _selectMenuOpt;

  set selectMenuOpt(int value) {
    _selectMenuOpt = value;
    notifyListeners();
  }


}