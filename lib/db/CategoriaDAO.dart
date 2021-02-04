import 'dart:async';
import 'package:botonera_app/db/AudioDAO.dart';
import 'package:botonera_app/db/OperationsDB.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:sqflite/sqflite.dart';

class CategoriaDAO {
  //#region CRUD
  static Future<void> insertCategoria(Categoria categoria) async {
    Database database = await OperationsDB.openDB();
    return database.insert(
      'Categoria',
      categoria.toMap(),
    );
  }

  static Future<void> updateCategoria(Categoria categoria) async {
    Database database = await OperationsDB.openDB();
    return database.update(
      "Categoria",
      categoria.toMap(),
      where: 'id = ?',
      whereArgs: [categoria.id],
    );
  }

  static Future<void> deleteCategoria(Categoria categoria) async {
    Database database = await OperationsDB.openDB();
    return database.delete(
      "Categoria",
      where: 'id = ?',
      whereArgs: [categoria.id],
    );
  }
  //endregion

  //#region Consultas
  static Future<List<Categoria>> getCategoria(bool conAudios) async {
    Database database = await OperationsDB.openDB();
    final List<Map<String, dynamic>> categoriasMap =
        await database.query('Categoria');

    return CategoriaDAO._toCategoriaList(conAudios, categoriasMap);
  }

  static Future<Categoria> getCategoriaById(int id, bool conAudios) async {
    Database database = await OperationsDB.openDB();
    List<Map> list =
        await database.rawQuery('SELECT * FROM Categoria WHERE id = $id');
    return CategoriaDAO._toCategoria(conAudios, list.first);
  }
  //#endregion

  //#region Conversores
  static Future<List<Categoria>> _toCategoriaList(
      bool conAudios, List<Map<String, dynamic>> categoriasMap) async {
    List<Categoria> categorias = List<Categoria>();
    for (int i = 0; i < categoriasMap.length; i++) {
      Categoria categoria = await _toCategoria(conAudios, categoriasMap[i]);
      categorias.add(categoria);
    }
    return categorias;
  }

  static Future<Categoria> _toCategoria(
      bool conAudios, Map<String, dynamic> categoriaMap) async {
    Categoria categoria = Categoria(
      id: categoriaMap['id'],
      nombre: categoriaMap['nombre'],
      imagen: categoriaMap['imagen'],
    );

    if (conAudios) {
      List<Audio> audios = await AudioDAO.getAudiosByCategoria(categoria);
      categoria.setAudios(audios);
    }

    return categoria;
  }
  //#endregion
}
