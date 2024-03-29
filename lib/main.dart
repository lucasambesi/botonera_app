import 'package:flutter/material.dart';
import 'package:botonera_app/Pages/HomePage/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(testDeviceIds: ['com.example.botonera_app']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botenera.App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
