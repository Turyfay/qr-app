import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/ui_provider.dart';
import 'package:qr_app/screens/home_screen.dart';
import 'package:qr_app/screens/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    



    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Code Scanner',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'map': (context) => MapPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.indigo,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.indigo,
            ),
          ),
      ),
    );
  }
}