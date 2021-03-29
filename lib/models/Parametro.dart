import 'package:flutter/cupertino.dart';

class Parametro {
  int _id;
  String _clave;
  String _valor;

  Parametro({
    int id,
    @required String clave,
    @required String valor,
  }) {
    this._id = id;
    this._clave = clave;
    this._valor = valor;
  }

  int get id => _id;
  String get clave => _clave;
  String get valor => _valor;

  void setValor(String valor) {
    this._valor = valor;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'clave': _clave,
      'valor': _valor,
    };
  }
}
