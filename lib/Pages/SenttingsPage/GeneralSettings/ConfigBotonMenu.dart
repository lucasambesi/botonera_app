import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/db/DAOs/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ConfigBotonMenu extends StatefulWidget {
  final String nombreBoton;
  final Parametro parametro;
  ConfigBotonMenu({@required this.nombreBoton, @required this.parametro});

  State<StatefulWidget> createState() => ConfigBotonMenuImpl(
        nombreBoton: nombreBoton,
        parametro: parametro,
      );
}

class ConfigBotonMenuImpl extends State<ConfigBotonMenu> {
  final String nombreBoton;
  Parametro parametro;
  Color currentColor;
  Color pickedColor;

  ConfigBotonMenuImpl({
    @required this.nombreBoton,
    @required this.parametro,
  });

  void changeColor(Color color) => setState(() => currentColor = color);
  void selectColor(Color color) => setState(() => pickedColor = color);

  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    setState(() {
      currentColor = ColorParser.hex(parametro.valor).getColor();
      pickedColor = currentColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(
      context,
      listen: false,
    );
    return ButtonTheme(
      minWidth: 200,
      height: 35,
      child: RaisedButton(
        child: Text(nombreBoton),
        color: currentColor,
        textColor: Helpers.getColorConstrastByParam(parametro),
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
                      paramsProvider.setParametrosProvider(parametro);
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
