import 'package:botonera_app/models/Categoria.dart';
import 'package:flutter/cupertino.dart';

class Audio {
  int _id;
  String _nombre;
  bool _favorito;
  Categoria _categoria;

  Audio({
    int id,
    @required String nombre,
    Categoria categoria,
    bool favorito,
  }) {
    this._id = id;
    this._nombre = nombre;
    this._categoria = categoria;
    this._favorito = favorito;
  }

  int get id => _id;
  String get nombre => _nombre;
  Categoria get categoria => _categoria;
  bool get favorito => _favorito;

  set favorito(bool favorito) => _favorito = favorito;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nombre': _nombre,
      'categoria': _categoria.id,
      'favorito': _favorito,
    };
  }
}
