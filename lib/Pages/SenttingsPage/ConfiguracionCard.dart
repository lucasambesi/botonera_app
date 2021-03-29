import 'package:botonera_app/Pages/SenttingsPage/BotonConfigColor.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfiguracionCard extends StatefulWidget {
  final String nombreTitulo;
  final String nombreParametro;

  ConfiguracionCard({
    @required this.nombreTitulo,
    @required this.nombreParametro,
  });

  @override
  _ConfiguracionCardState createState() => _ConfiguracionCardState(
        nombreTitulo: nombreTitulo,
        nombreParametro: nombreParametro,
      );
}

class _ConfiguracionCardState extends State<ConfiguracionCard> {
  final String nombreTitulo;
  final String nombreParametro;

  _ConfiguracionCardState({
    @required this.nombreTitulo,
    @required this.nombreParametro,
  });

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Text(
                  nombreTitulo,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: BotonConfigColor(
                  parametro:
                      paramsProvider.getParametroByClave(nombreParametro),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
