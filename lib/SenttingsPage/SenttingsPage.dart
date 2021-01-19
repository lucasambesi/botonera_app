import 'package:botonera_app/FileOperations/FileUtils.dart';
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
        title: Text('Prueba de ficheros'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              FileUtils.saveToFile(myController.text);
            },
          ),
          RaisedButton(
            child: Text('leer'),
            onPressed: () {
              FileUtils.readFromFile().then((contents) {
                setState(() {
                  text = contents;
                });
              });
            },
          ),
          TextField(
            controller: myController,
          ),
          SizedBox(
            height: 30,
          ),
          Text(text),
        ],
      ),
    );
  }
}
