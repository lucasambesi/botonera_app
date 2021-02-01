import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaConfiguracion extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaConfiguracionImpl();
}

class PantallaConfiguracionImpl extends State<PantallaConfiguracion> {
  String text = "";
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connfiguración'),
      ),
      body: Container(),
    );
  }
}
