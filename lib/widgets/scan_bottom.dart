import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
        print(barcodeScanRes);
      }, 
      child: const Icon(Icons.filter_center_focus)

      );
  }
}