import 'package:botonera_app/db/ParametroDAO.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarraColores extends StatefulWidget {
  final String nombreParametro;
  BarraColores({@required this.nombreParametro});
  State<StatefulWidget> createState() =>
      BarraColoresImpl(nombreParametro: nombreParametro);
}

class SelectWidget {
  bool _isSelected;
  Color _color;

  SelectWidget({
    @required bool isSelected,
    @required Color color,
  }) {
    this._isSelected = isSelected;
    this._color = color;
  }

  bool get isSelected => _isSelected;
  Color get color => _color;

  void setSelected(bool valor) {
    this._isSelected = valor;
  }
}

class BarraColoresImpl extends State<BarraColores> {
  List<SelectWidget> isSelected;
  List<Parametro> parametros;
  Parametro colorFondo;
  final String nombreParametro;
  BarraColoresImpl({@required this.nombreParametro});
  @override
  void initState() {
    super.initState();
    setColor();
  }

  // Future<void> setColor() async {
  //   ParametroDAO.getParametros().then((content) {
  //     setState(() {
  //       parametros = content;
  //     });
  //   });
  // }

  Future<void> setColor() async {
    List<Parametro> params = await ParametroDAO.getParametros();
    Parametro colorFondoAux =
        params.where((x) => x.clave == nombreParametro).first;
    setState(() {
      parametros = params;
      colorFondo = colorFondoAux;
      setIsSelected();
    });
  }

  setIsSelected() {
    setState(
      () {
        isSelected = [
          SelectWidget(
            isSelected: esColorActual(Colors.yellow[300]),
            color: Colors.yellow[300],
          ),
          SelectWidget(
            isSelected: esColorActual(Colors.red[300]),
            color: Colors.red[300],
          ),
          SelectWidget(
            isSelected: esColorActual(Colors.blue[300]),
            color: Colors.blue[300],
          ),
          SelectWidget(
            isSelected: esColorActual(
              Colors.green[300],
            ),
            color: Colors.green[300],
          ),
          SelectWidget(
            isSelected: esColorActual(Colors.purple[300]),
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
        Parametro parametro =
            parametros.where((x) => x.clave == nombreParametro).first;

        parametro.setValor(
            ColorParser.color(getSelectedWidget(isSelected).color).toHex());
        ParametroDAO.updateParametro(parametro);
      },
      isSelected: getListBoolSelected(isSelected),
    );
  }

  List<bool> getListBoolSelected(List<SelectWidget> isSelectedList) {
    List<bool> isSelectedBool = new List<bool>();
    for (int i = 0; i < isSelected.length; i++) {
      isSelectedBool.add(isSelected[i].isSelected);
    }
    return isSelectedBool;
  }

  SelectWidget getSelectedWidget(List<SelectWidget> isSelected) {
    SelectWidget selected;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i].isSelected) {
        selected = isSelected[i];
        break;
      }
    }
    return selected;
  }

//Esto no funciona
  bool esColorActual(Color color) {
    // Parametro colorFondo =
    //     parametros.where((x) => x.clave == nombreParametro).first;
    return colorFondo.valor == ColorParser.color(color).toHex();
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
