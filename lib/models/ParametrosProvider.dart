import 'package:botonera_app/models/Parametro.dart';
import 'package:flutter/cupertino.dart';

class ParametrosProvider with ChangeNotifier {
  Parametro _colorFondoMenu;
  Parametro _colorBotonSonidos;
  Parametro _colorBotonConfig;
  Parametro _colorBotonSalir;
  Parametro _colorFondoSonidos;
  Parametro _colorFondoConfig;
  Parametro _colorBarraSuperior;
  Parametro _colorBarraInferior;

  ParametrosProvider({
    @required List<Parametro> parametros,
  }) {
    for (Parametro parametro in parametros) setParametrosProvider(parametro);
  }

  Parametro get colorFondoMenu => _colorFondoMenu;
  Parametro get colorBotonSonidos => _colorBotonSonidos;
  Parametro get colorBotonConfig => _colorBotonConfig;
  Parametro get colorBotonSalir => _colorBotonSalir;
  Parametro get colorFondoSonidos => _colorFondoSonidos;
  Parametro get colorFondoConfig => _colorFondoConfig;
  Parametro get colorBarraSuperior => _colorBarraSuperior;
  Parametro get colorBarraInferior => _colorBarraInferior;

  Parametro getParametroByClave(String clave) {
    switch (clave) {
      case "colorFondoMenu":
        return colorFondoMenu;
        break;
      case "colorBotonSonidos":
        return colorBotonSonidos;
        break;
      case "colorBotonConfig":
        return colorBotonConfig;
        break;
      case "colorBotonSalir":
        return colorBotonSalir;
        break;
      case "colorFondoSonidos":
        return colorFondoSonidos;
        break;
      case "colorFondoConfig":
        return colorFondoConfig;
        break;
      case "colorBarraSuperior":
        return colorBarraSuperior;
        break;
      case "colorBarraInferior":
        return colorBarraInferior;
        break;
      default:
        return null;
    }
  }

  void setParametrosProvider(Parametro parametro) {
    switch (parametro.clave) {
      case "colorFondoMenu":
        setcolorFondoMenu(parametro);
        break;
      case "colorBotonSonidos":
        setcolorBotonSonidos(parametro);
        break;
      case "colorBotonConfig":
        setcolorBotonConfig(parametro);
        break;
      case "colorBotonSalir":
        setcolorBotonSalir(parametro);
        break;
      case "colorFondoSonidos":
        setcolorFondoSonidos(parametro);
        break;
      case "colorFondoConfig":
        setcolorFondoConfig(parametro);
        break;
      case "colorBarraSuperior":
        setcolorBarraSuperior(parametro);
        break;
      case "colorBarraInferior":
        setcolorBarraInferior(parametro);
        break;
      default:
        break;
    }
  }

  void setcolorFondoMenu(Parametro colorFondoMenu) {
    this._colorFondoMenu = colorFondoMenu;
    notifyListeners();
  }

  void setcolorBotonSonidos(Parametro colorBotonSonidos) {
    this._colorBotonSonidos = colorBotonSonidos;
    notifyListeners();
  }

  void setcolorBotonConfig(Parametro colorBotonConfig) {
    this._colorBotonConfig = colorBotonConfig;
    notifyListeners();
  }

  void setcolorBotonSalir(Parametro colorBotonSalir) {
    this._colorBotonSalir = colorBotonSalir;
    notifyListeners();
  }

  void setcolorFondoSonidos(Parametro colorFondoSonidos) {
    this._colorFondoSonidos = colorFondoSonidos;
    notifyListeners();
  }

  void setcolorFondoConfig(Parametro colorFondoConfig) {
    this._colorFondoConfig = colorFondoConfig;
    notifyListeners();
  }

  void setcolorBarraSuperior(Parametro colorBarraSuperior) {
    this._colorBarraSuperior = colorBarraSuperior;
    notifyListeners();
  }

  void setcolorBarraInferior(Parametro colorBarraInferior) {
    this._colorBarraInferior = colorBarraInferior;
    notifyListeners();
  }
}
