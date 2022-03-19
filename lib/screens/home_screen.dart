import 'package:flutter/material.dart';
import 'package:qr_app/screens/direcciones_screen.dart';
import 'package:qr_app/screens/mapas_screen.dart';
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
      body: _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const currentIndex = 1;

    switch(currentIndex){
      case 0:
        return const MapasScreen();
      case 1:
        return const DireccionesScreen();
      default:
        return const MapasScreen();
    }

    
  }
}