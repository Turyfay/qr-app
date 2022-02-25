import 'package:flutter/material.dart';
import 'package:qr_app/widgets/custom_navigator_bar.dart';
import 'package:qr_app/widgets/scan_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Center (child:Text('Historial')),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded)),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}