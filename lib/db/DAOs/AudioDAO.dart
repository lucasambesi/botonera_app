import 'dart:async';
import 'package:botonera_app/db/DAOs/CategoriaDAO.dart';
import 'package:botonera_app/db/OperationsDB.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:sqflite/sqflite.dart';

class AudioDAO {
  //#region CRUD
  static Future<void> insertAudio(Audio audio) async {
    Database database = await OperationsDB.openDB();
    return database.insert(
      'Audio',
      audio.toMap(),
    );
  }

  static Future<void> updateAudio(Audio audio) async {
    Database database = await OperationsDB.openDB();
    return database.update(
      "Audio",
      audio.toMap(),
      where: 'id = ?',
      whereArgs: [audio.id],
    );
  }

  static Future<void> deleteAudio(Audio audio) async {
    Database database = await OperationsDB.openDB();
    return database.delete(
      "Audio",
      where: 'id = ?',
      whereArgs: [audio.id],
    );
  }

  //#endregion CRUD

  //#region Consultas
  static Future<List<Audio>> getAudios() async {
    Database database = await OperationsDB.openDB();
    final List<Map<String, dynamic>> audiosMap = await database.query('Audio');

    return AudioDAO._toAudioList(audiosMap);
  }

  static Future<Audio> getAudioById(int id) async {
    Database database = await OperationsDB.openDB();
    List<Map> list =
        await database.rawQuery('SELECT * FROM Audio WHERE id = $id');
    return AudioDAO._toAudio(list.first);
  }

  static Future<List<Audio>> getAudiosByCategoria(Categoria categoria) async {
    Database database = await OperationsDB.openDB();
    int idCategoria = categoria.id;
    List<Map> list = await database
        .rawQuery('SELECT * FROM Audio WHERE categoria = $idCategoria');

    return AudioDAO._toAudioList(list);
  }

  static Future<List<Audio>> getAudiosByNombreCategoria(
      String nombreCategoria) async {
    Database database = await OperationsDB.openDB();
    List<Map> list = await database
        .rawQuery('SELECT a.* FROM Audio a INNER JOIN Categoria c '
            'ON c.id = a.categoria '
            'WHERE c.nombre = "$nombreCategoria"');

    return AudioDAO._toAudioList(list);
  }

  static Future<List<Audio>> getAudiosFavoritos() async {
    Database database = await OperationsDB.openDB();

    List<Map> list =
        await database.rawQuery('SELECT * FROM Audio WHERE favorito = 1');

    return AudioDAO._toAudioList(list);
  }
  //#endregion

  //#region Conversores
  static Future<List<Audio>> _toAudioList(
      List<Map<String, dynamic>> audiosMap) async {
    List<Audio> audios = List<Audio>();
    for (int i = 0; i < audiosMap.length; i++) {
      Audio audio = await _toAudio(audiosMap[i]);
      audios.add(audio);
    }
    return audios;
  }

  static Future<Audio> _toAudio(Map<String, dynamic> audioMap) async {
    return Audio(
      id: audioMap['id'],
      nombre: audioMap['nombre'],
      imagen: audioMap['imagen'],
      favorito: audioMap['favorito'] == 1 ? true : false,
      categoria:
          await CategoriaDAO.getCategoriaById(audioMap['categoria'], false),
    );
  }
  //#endregion
}
