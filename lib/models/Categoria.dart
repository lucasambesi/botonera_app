import 'package:botonera_app/models/Audio.dart';
import 'package:flutter/cupertino.dart';

class Categoria {
  int _id;
  String _nombre;
  List<Audio> _audios;
  String _imagen;

  Categoria({
    int id,
    @required String nombre,
    String imagen,
    List<Audio> audios,
  }) {
    this._id = id;
    this._nombre = nombre;
    this._imagen = imagen;
    this._audios = audios;
  }

  int get id => _id;
  String get nombre => _nombre;
  String get imagen => _imagen;
  List<Audio> get audios => _audios;

  void setAudios(List<Audio> audios) {
    this._audios = audios;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nombre': _nombre,
      'imagen': _imagen,
      'audios': _audios,
    };
  }
}
