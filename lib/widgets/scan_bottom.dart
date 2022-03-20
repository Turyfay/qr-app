import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';


class ScanBottom extends StatelessWidget {
  const ScanBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return FloatingActionButton(
      //elevation: 00,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", 
            "Cancelar", 
            false, 
            ScanMode.QR
        );
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.addScan(barcodeScanRes);
      }, 
      child: const Icon(Icons.filter_center_focus)

      );
  }
}