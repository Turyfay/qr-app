import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/screens/direcciones_screen.dart';
import 'package:qr_app/screens/mapas_screen.dart';
import 'package:qr_app/widgets/custom_navigator_bar.dart';
import 'package:qr_app/widgets/scan_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Center (child:Text('Historial')),
        actions: [
          IconButton(onPressed: (){
            scanListProvider.borrarTodosScans();
          }, 
          icon: const Icon(Icons.delete_forever_rounded)),
        ],
      ),
      body: const _HomeScreenBody(),
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
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectMenuOpt;

    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context,listen: false);


    switch(currentIndex){
      case 0:
      scanListProvider.cargarScanporTipo('geo');
        return const MapasScreen();
      case 1:
      scanListProvider.cargarScanporTipo('http');
        return const DireccionesScreen();
      default:
        return const MapasScreen();
    }

    
  }
}