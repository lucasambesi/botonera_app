import 'package:botonera_app/models/Categoria.dart';
import 'package:flutter/cupertino.dart';

class Audio {
  int _id;
  String _nombre;
  bool _favorito;
  Categoria _categoria;
  String _imagen;

  Audio({
    int id,
    @required String nombre,
    Categoria categoria,
    bool favorito,
    String imagen,
  }) {
    this._id = id;
    this._nombre = nombre;
    this._categoria = categoria;
    this._favorito = favorito;
    this._imagen = imagen;
  }

  int get id => _id;
  String get nombre => _nombre;
  Categoria get categoria => _categoria;
  bool get favorito => _favorito;
  String get imagen => _imagen;

  set favorito(bool favorito) => _favorito = favorito;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nombre': _nombre,
      'categoria': _categoria.id,
      'favorito': _favorito,
      'imagen': _imagen,
    };
  }
}
