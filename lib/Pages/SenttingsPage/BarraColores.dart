import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:botonera_app/models/SelectedWidget.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraColores extends StatefulWidget {
  final String nombreParametro;
  BarraColores({@required this.nombreParametro});
  State<StatefulWidget> createState() =>
      BarraColoresImpl(nombreParametro: nombreParametro);
}

class BarraColoresImpl extends State<BarraColores> {
  List<SelectedWidget> isSelected;
  List<Parametro> parametros;
  Parametro parametro;
  final String nombreParametro;
  BarraColoresImpl({@required this.nombreParametro});
  @override
  void initState() {
    super.initState();
    setColor();
  }

  Future<void> setColor() async {
    List<Parametro> params = await ParametroDAO.getParametros();
    Parametro parametroAux =
        params.where((x) => x.clave == nombreParametro).first;
    setState(() {
      parametros = params;
      parametro = parametroAux;
      setIsSelected();
    });
  }

  setIsSelected() {
    setState(
      () {
        isSelected = [
          SelectedWidget(
            isSelected: esColorActual(Colors.yellow[300]),
            color: Colors.yellow[300],
          ),
          SelectedWidget(
            isSelected: esColorActual(Colors.red[300]),
            color: Colors.red[300],
          ),
          SelectedWidget(
            isSelected: esColorActual(Colors.blue[300]),
            color: Colors.blue[300],
          ),
          SelectedWidget(
            isSelected: esColorActual(
              Colors.green[300],
            ),
            color: Colors.green[300],
          ),
          SelectedWidget(
            isSelected: esColorActual(
              Colors.purple[300],
            ),
            color: Colors.purple[300],
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(20),
      borderWidth: 2,
      selectedBorderColor: Colors.black,
      renderBorder: true,
      children: <Widget>[
        SubColor(
          color: (isSelected[0].color),
        ),
        SubColor(
          color: isSelected[1].color,
        ),
        SubColor(
          color: isSelected[2].color,
        ),
        SubColor(
          color: isSelected[3].color,
        ),
        SubColor(
          color: isSelected[4].color,
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            bool selected = i == index;
            isSelected[i].setSelected(selected);
          }
        });

        parametro.setValor(
            ColorParser.color(getSelectedWidget(isSelected).color).toHex());
        ParametroDAO.updateParametro(parametro);
      },
      isSelected: getListBoolSelected(isSelected),
    );
  }

  List<bool> getListBoolSelected(List<SelectedWidget> isSelectedList) {
    List<bool> isSelectedBool = new List<bool>();
    for (int i = 0; i < isSelected.length; i++) {
      isSelectedBool.add(isSelected[i].isSelected);
    }
    return isSelectedBool;
  }

  SelectedWidget getSelectedWidget(List<SelectedWidget> isSelected) {
    SelectedWidget selected;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i].isSelected) {
        selected = isSelected[i];
        break;
      }
    }
    return selected;
  }

  bool esColorActual(Color color) {
    return parametro.valor == ColorParser.color(color).toHex();
  }
}

class SubColor extends StatefulWidget {
  final Color color;

  SubColor({@required this.color});

  State<StatefulWidget> createState() => SubColorImpl(color: color);
}

class SubColorImpl extends State<SubColor> {
  final Color color;
  List<bool> isSelected;

  SubColorImpl({@required this.color});

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}
