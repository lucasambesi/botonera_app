import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CretidosAlert extends StatefulWidget {
  State<StatefulWidget> createState() => CretidosAlertImpl();
}

class CretidosAlertImpl extends State<CretidosAlert> {
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
          ),
          SizedBox(height: 15),
          Text(
            'Esta aplicacición utiliza sonidos virales de internet.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'Antes cualquier duda o problema comunicarse con lcsstudio@gmail.com',
            textAlign: TextAlign.center,
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
