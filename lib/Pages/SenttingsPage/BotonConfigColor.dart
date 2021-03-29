import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class BotonConfigColor extends StatefulWidget {
  Parametro parametro;

  BotonConfigColor({
    @required this.parametro,
  });

  State<StatefulWidget> createState() => BotonConfigColorImpl(
        parametro: parametro,
      );
}

class BotonConfigColorImpl extends State<BotonConfigColor> {
  Color currentColor;
  Color pickedColor;
  Parametro parametro;

  BotonConfigColorImpl({
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
    var paramsProvider =
        Provider.of<ParametrosProvider>(context, listen: false);
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 6.0,
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
                    parametro.setValor(ColorParser.color(currentColor).toHex());
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
    );
  }
}
