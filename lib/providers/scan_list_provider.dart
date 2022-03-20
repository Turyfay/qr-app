import 'package:flutter/material.dart';
import 'package:qr_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> _scanList = [];

  String tipoSeleccionado = 'http';

  List<ScanModel> get scanList => _scanList;

  void addScan(String valor) async {

    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScanRaw(nuevoScan);
    nuevoScan.id = id;
    if(tipoSeleccionado == nuevoScan.tipo){
       _scanList.add(nuevoScan);
       notifyListeners();
    }
  }

  cargarScans() async {
    final scans = (await DBProvider.db.getTodosScans())!;
    _scanList = [...scans];
    notifyListeners();
  }

  cargarScanporTipo(String tipo) async {
    final scans = (await DBProvider.db.getScansPorTipo(tipo))!;
    _scanList = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodosScans() async {
    await DBProvider.db.deleteAll();
    _scanList = [];
    notifyListeners();
  }
  borraScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    _scanList = _scanList.where((s) => s.id != id).toList();
    notifyListeners();
  }


}