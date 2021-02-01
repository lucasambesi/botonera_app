import 'package:botonera_app/models/Audio.dart';
import 'package:flutter/cupertino.dart';

class Categoria {
  int _id;
  String _nombre;
  List<Audio> _audios;

  Categoria({
    int id,
    @required String nombre,
    List<Audio> audios,
  }) {
    this._id = id;
    this._nombre = nombre;
    this._audios = audios;
  }

  int get id => _id;
  String get nombre => _nombre;
  List<Audio> get audios => _audios;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nombre': _nombre,
      'audios': _audios,
    };
  }
}
