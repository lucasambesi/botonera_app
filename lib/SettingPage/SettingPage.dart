import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaConfiguracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          child: Text('Volver'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
