import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';

class DireccionesScreen extends StatelessWidget {
  const DireccionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
      itemCount: scanListProvider.scanList.length,
      itemBuilder: (_,index){
        return ListTile(
          leading: const Icon(Icons.cloud_queue,color: Colors.indigo,),
          title: Text(scanListProvider.scanList[index].valor),
          subtitle: Text("ID: "+scanListProvider.scanList[index].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
          onTap: (){
            
          },
        );
      }, 
   );
  }
}