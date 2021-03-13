import 'package:botonera_app/Pages/SenttingsPage/BarraColores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemaGeneralAplicacion extends StatelessWidget {
  const TemaGeneralAplicacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: SizedBox(
        height: 120.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Tema general de Aplicacion:'),
                ],
              ),
              Spacer(),
              BarraColores(
                nombreParametro: 'colorFondo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
