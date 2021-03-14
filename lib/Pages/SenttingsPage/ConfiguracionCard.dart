import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ConfiguracionCard extends StatefulWidget {
  final String nombreTitulo;
  final String nombreParametro;

  ConfiguracionCard({
    @required this.nombreTitulo,
    @required this.nombreParametro,
  });

  State<StatefulWidget> createState() => ConfiguracionCardImpl(
        nombreTitulo: nombreTitulo,
        nombreParametro: nombreParametro,
      );
}

class ConfiguracionCardImpl extends State<ConfiguracionCard> {
  String nombreTitulo;
  String nombreParametro;
  ConfiguracionCardImpl({
    @required this.nombreTitulo,
    @required this.nombreParametro,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: SizedBox(
        height: 120.0,
        width: ((MediaQuery.of(context).size.width) / 2.12),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Text(nombreTitulo),
              ),
              Flexible(
                child: Spacer(),
              ),
              BotonConfigColor(
                nombreParametro: nombreParametro,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BotonConfigColor extends StatefulWidget {
  final String nombreParametro;

  BotonConfigColor({
    @required this.nombreParametro,
  });

  State<StatefulWidget> createState() => BotonConfigColorImpl(
        nombreParametro: nombreParametro,
      );
}

class BotonConfigColorImpl extends State<BotonConfigColor> {
  final String nombreParametro;
  Color currentColor;
  Color pickedColor;
  Parametro parametro;

  BotonConfigColorImpl({
    @required this.nombreParametro,
  });

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
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 2.0,
        fillColor: currentColor,
        padding: const EdgeInsets.all(15.0),
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
