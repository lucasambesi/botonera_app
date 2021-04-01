import 'package:botonera_app/models/Parametro.dart';
import 'package:flutter/cupertino.dart';

class ParametrosProvider with ChangeNotifier {
  Parametro _colorFondoMenu;
  Parametro _colorBotonSonidos;
  Parametro _colorBotonConfig;
  Parametro _colorBotonCreditos;
  Parametro _colorBotonSalir;
  Parametro _colorFondoSonidos;
  Parametro _colorFondoConfig;
  Parametro _colorBarraSuperior;
  Parametro _colorBarraInferior;
  Parametro _colorFondoAudio;
  Parametro _colorBotonAudio;
  Parametro _colorIconosAudio;
  Parametro _colorEnFavoritos;
  Parametro _colorFondoInfoAudio;
  Parametro _colorFondoCategoria;

  ParametrosProvider({
    @required List<Parametro> parametros,
  }) {
    for (Parametro parametro in parametros) setParametrosProvider(parametro);
  }

  Parametro get colorFondoMenu => _colorFondoMenu;
  Parametro get colorBotonSonidos => _colorBotonSonidos;
  Parametro get colorBotonConfig => _colorBotonConfig;
  Parametro get colorBotonCreditos => _colorBotonCreditos;
  Parametro get colorBotonSalir => _colorBotonSalir;
  Parametro get colorFondoSonidos => _colorFondoSonidos;
  Parametro get colorFondoConfig => _colorFondoConfig;
  Parametro get colorBarraSuperior => _colorBarraSuperior;
  Parametro get colorBarraInferior => _colorBarraInferior;
  Parametro get colorFondoAudio => _colorFondoAudio;
  Parametro get colorBotonAudio => _colorBotonAudio;
  Parametro get colorIconosAudio => _colorIconosAudio;
  Parametro get colorEnFavoritos => _colorEnFavoritos;
  Parametro get colorFondoInfoAudio => _colorFondoInfoAudio;
  Parametro get colorFondoCategoria => _colorFondoCategoria;

  Parametro getParametroByClave(String clave) {
    switch (clave) {
      case "colorFondoMenu":
        return colorFondoMenu;
        break;
      case "colorBotonSonidos":
        return colorBotonSonidos;
        break;
      case "colorBotonCreditos":
        return colorBotonCreditos;
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
      case "colorFondoAudio":
        return colorFondoAudio;
        break;
      case "colorBotonAudio":
        return colorBotonAudio;
        break;
      case "colorIconosAudio":
        return colorIconosAudio;
        break;
      case "colorEnFavoritos":
        return colorEnFavoritos;
        break;
      case "colorFondoInfoAudio":
        return colorFondoInfoAudio;
        break;
      case "colorFondoCategoria":
        return colorFondoCategoria;
        break;
      default:
        return null;
    }
  }

  void setParametrosProvider(Parametro parametro) {
    switch (parametro.clave) {
      case "colorFondoMenu":
        setColorFondoMenu(parametro);
        break;
      case "colorBotonSonidos":
        setColorBotonSonidos(parametro);
        break;
      case "colorBotonConfig":
        setColorBotonConfig(parametro);
        break;
      case "colorBotonCreditos":
        setColorBotonCreditos(parametro);
        break;
      case "colorBotonSalir":
        setColorBotonSalir(parametro);
        break;
      case "colorFondoSonidos":
        setColorFondoSonidos(parametro);
        break;
      case "colorFondoConfig":
        setColorFondoConfig(parametro);
        break;
      case "colorBarraSuperior":
        setColorBarraSuperior(parametro);
        break;
      case "colorBarraInferior":
        setColorBarraInferior(parametro);
        break;
      case "colorFondoAudio":
        setColorFondoAudio(parametro);
        break;
      case "colorBotonAudio":
        setColorBotonAudio(parametro);
        break;
      case "colorIconosAudio":
        setColorIconosAudio(parametro);
        break;
      case "colorEnFavoritos":
        setColorEnFavoritos(parametro);
        break;
      case "colorFondoInfoAudio":
        setColorFondoInfoAudio(parametro);
        break;
      case "colorFondoCategoria":
        setColorFondoCategoria(parametro);
        break;
      default:
        break;
    }
  }

  void setColorFondoMenu(Parametro colorFondoMenu) {
    this._colorFondoMenu = colorFondoMenu;
    notifyListeners();
  }

  void setColorBotonSonidos(Parametro colorBotonSonidos) {
    this._colorBotonSonidos = colorBotonSonidos;
    notifyListeners();
  }

  void setColorBotonConfig(Parametro colorBotonConfig) {
    this._colorBotonConfig = colorBotonConfig;
    notifyListeners();
  }

  void setColorBotonCreditos(Parametro colorBotonCreditos) {
    this._colorBotonCreditos = colorBotonCreditos;
    notifyListeners();
  }

  void setColorBotonSalir(Parametro colorBotonSalir) {
    this._colorBotonSalir = colorBotonSalir;
    notifyListeners();
  }

  void setColorFondoSonidos(Parametro colorFondoSonidos) {
    this._colorFondoSonidos = colorFondoSonidos;
    notifyListeners();
  }

  void setColorFondoConfig(Parametro colorFondoConfig) {
    this._colorFondoConfig = colorFondoConfig;
    notifyListeners();
  }

  void setColorBarraSuperior(Parametro colorBarraSuperior) {
    this._colorBarraSuperior = colorBarraSuperior;
    notifyListeners();
  }

  void setColorBarraInferior(Parametro colorBarraInferior) {
    this._colorBarraInferior = colorBarraInferior;
    notifyListeners();
  }

  void setColorFondoAudio(Parametro colorFondoAudio) {
    this._colorFondoAudio = colorFondoAudio;
    notifyListeners();
  }

  void setColorBotonAudio(Parametro colorBotonAudio) {
    this._colorBotonAudio = colorBotonAudio;
    notifyListeners();
  }

  void setColorIconosAudio(Parametro colorIconosAudio) {
    this._colorIconosAudio = colorIconosAudio;
    notifyListeners();
  }

  void setColorEnFavoritos(Parametro colorEnFavoritos) {
    this._colorEnFavoritos = colorEnFavoritos;
    notifyListeners();
  }

  void setColorFondoInfoAudio(Parametro colorFondoInfoAudio) {
    this._colorFondoInfoAudio = colorFondoInfoAudio;
    notifyListeners();
  }

  void setColorFondoCategoria(Parametro colorFondoCategoria) {
    this._colorFondoCategoria = colorFondoCategoria;
    notifyListeners();
  }
}
