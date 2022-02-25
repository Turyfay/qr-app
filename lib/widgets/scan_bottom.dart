import 'package:flutter/material.dart';

class ScanBottom extends StatelessWidget {
  const ScanBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //elevation: 00,
      onPressed: () {}, 
      child: const Icon(Icons.filter_center_focus)
      );
  }
}