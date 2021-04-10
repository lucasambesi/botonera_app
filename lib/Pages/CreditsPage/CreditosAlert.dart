import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CretidosAlert extends StatefulWidget {
  State<StatefulWidget> createState() => _CretidosAlertState();
}

class _CretidosAlertState extends State<CretidosAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Créditos',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Desarrollado por LCS Studio.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 15),
          Text(
            'Esta aplicacición utiliza sonidos virales de internet.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'Antes cualquier duda o problema comunicarse con:',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'lcsstudio@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.yellow[300]),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Cerrar',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
