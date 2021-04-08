import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/db/DAOs/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class CategoriaCardMuestra extends StatefulWidget {
  final Parametro parametro;

  const CategoriaCardMuestra({@required this.parametro});

  State<StatefulWidget> createState() =>
      _CategoriaCardMuestraState(parametro: parametro);
}

class _CategoriaCardMuestraState extends State<CategoriaCardMuestra> {
  Color currentColor;
  Color pickedColor;
  Parametro parametro;

  _CategoriaCardMuestraState({
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
    var paramsProvider = Provider.of<ParametrosProvider>(context);
    return GestureDetector(
      onTap: () {
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
      child: Card(
        color: Helpers.getColorByParam(
          paramsProvider.colorFondoCategoria,
        ),
        child: ListTile(
          leading: Icon(
            Icons.category,
            color: Helpers.getColorConstrastByParam(
                paramsProvider.colorFondoCategoria),
          ),
          title: Row(
            children: [
              Text(
                'Categoria de muestra',
                style: TextStyle(
                  color: Helpers.getColorConstrastByParam(
                    paramsProvider.colorFondoCategoria,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
