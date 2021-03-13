import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
    return Card(
      elevation: 2.0,
      child: SizedBox(
        height: 200.0,
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
                child: Boton(
                  nombreBoton: 'Sonidos',
                  nombreParametro: 'colorBotonSonidos',
                ),
              ),
              Spacer(),
              Expanded(
                child: Boton(
                  nombreBoton: 'Configuración',
                  nombreParametro: 'colorBotonConfig',
                ),
              ),
              Spacer(),
              Expanded(
                child: Boton(
                  nombreBoton: 'Salir',
                  nombreParametro: 'colorBotonSalir',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Boton extends StatefulWidget {
  final String nombreBoton;
  final String nombreParametro;
  Boton({@required this.nombreBoton, @required this.nombreParametro});

  State<StatefulWidget> createState() => BotonImpl(
        nombreBoton: nombreBoton,
        nombreParametro: nombreParametro,
      );
}

class BotonImpl extends State<Boton> {
  final String nombreBoton;
  final String nombreParametro;
  Color currentColor;
  Color pickedColor;
  Parametro parametro;

  BotonImpl({@required this.nombreBoton, @required this.nombreParametro});
  void changeColor(Color color) => setState(() => currentColor = color);
  void selectColor(Color color) => setState(() => pickedColor = color);
  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    List<Parametro> params = await ParametroDAO.getParametros();
    Parametro paramAux = params.where((x) => x.clave == nombreParametro).first;
    setState(() {
      parametro = paramAux;
      currentColor = ColorParser.hex(paramAux.valor).getColor();
      pickedColor = currentColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 35,
      child: RaisedButton(
        child: Text(nombreBoton),
        color: currentColor,
        textColor: useWhiteForeground(currentColor)
            ? const Color(0xffffffff)
            : const Color(0xff000000),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                titlePadding: const EdgeInsets.all(0.0),
                contentPadding: const EdgeInsets.all(0.0),
                content: SingleChildScrollView(
                  child: MaterialPicker(
                    pickerColor: currentColor,
                    onColorChanged: selectColor,
                    enableLabel: true,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    textColor: Colors.black,
                    child: Text(
                      'Elegir color',
                    ),
                    onPressed: () {
                      changeColor(pickedColor);
                      parametro
                          .setValor(ColorParser.color(currentColor).toHex());
                      ParametroDAO.updateParametro(parametro);

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
