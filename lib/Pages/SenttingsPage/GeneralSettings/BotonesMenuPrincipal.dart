import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/ConfigBotonMenu.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BotonesMenuPrincipal extends StatefulWidget {
  BotonesMenuPrincipal();
  State<StatefulWidget> createState() => BotonesMenuPrincipalImpl();
}

class BotonesMenuPrincipalImpl extends State<BotonesMenuPrincipal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return Card(
      elevation: 2.0,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Boton menú principal:',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Spacer(),
              Expanded(
                child: ConfigBotonMenu(
                  nombreBoton: 'Sonidos',
                  parametro:
                      paramsProvider.getParametroByClave('colorBotonSonidos'),
                ),
              ),
              Spacer(),
              Expanded(
                child: ConfigBotonMenu(
                  nombreBoton: 'Configuración',
                  parametro:
                      paramsProvider.getParametroByClave('colorBotonConfig'),
                ),
              ),
              Spacer(),
              Expanded(
                child: ConfigBotonMenu(
                  nombreBoton: 'Créditos',
                  parametro:
                      paramsProvider.getParametroByClave('colorBotonCreditos'),
                ),
              ),
              Spacer(),
              Expanded(
                child: ConfigBotonMenu(
                  nombreBoton: 'Salir',
                  parametro:
                      paramsProvider.getParametroByClave('colorBotonSalir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
