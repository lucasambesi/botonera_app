import 'dart:async';
import 'dart:io';
import 'package:botonera_app/Helpers/Data.dart';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

//#region Constantes
const database = 'test9.db';
//#endregion

//#region Datos
var data = DataDB.getData();
var parametros = DataDB.getParametros();
//#endregion

class OperationsDB {
  static Future<Database> openDB() async {
    try {
      Database db = await openDatabase(
        join(
          await getDatabasesPath(),
          database,
        ),
        onCreate: (db, version) {
          var qry;

          //Categoria
          qry = "CREATE TABLE IF NOT EXISTS Categoria("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "nombre TEXT,"
              "imagen TEXT"
              ")";

          db.execute(qry);

          //Audio
          qry = "CREATE TABLE IF NOT EXISTS Audio("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "nombre TEXT,"
              "favorito BIT,"
              "imagen TEXT,"
              "categoria INTEGER NOT NULL,"
              "FOREIGN KEY(categoria) REFERENCES Categoria(id)"
              ")";

          db.execute(qry);

          //Parametros
          qry = "CREATE TABLE IF NOT EXISTS Parametro("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "clave TEXT,"
              "valor TEXT"
              ")";

          db.execute(qry);

          for (var i = 0; i < data.length; i++) {
            try {
              Categoria categoria = Categoria(
                  id: i + 1,
                  nombre: data[i]["nombre"],
                  imagen: data[i]["imagen"]);
              List<Map> audios = data[i]["audios"];

              var qry =
                  'INSERT INTO Categoria(nombre,imagen) VALUES("${categoria.nombre}","${categoria.imagen}")';
              db.rawInsert(qry);

              for (var c = 0; c < audios.length; c++) {
                Audio audio = Audio(
                  nombre: audios[c]["nombre"],
                  favorito: audios[c]["favorito"],
                  imagen: audios[c]["imagen"],
                  categoria: categoria,
                );

                var qryAudio =
                    'INSERT INTO Audio(nombre,favorito,imagen,categoria) VALUES("${audio.nombre}",${audio.favorito ? 1 : 0},"${audio.imagen}",${categoria.id})';
                db.rawInsert(qryAudio);
              }
            } catch (e) {
              print("ERRR >>>");
              print(e);
            }
          }

          for (var i = 0; i < parametros.length; i++) {
            try {
              Parametro parametro = Parametro(
                id: i + 1,
                clave: parametros[i]["clave"],
                valor: parametros[i]["valor"],
              );

              var qryParametros =
                  'INSERT INTO Parametro(clave,valor) VALUES("${parametro.clave}","${parametro.valor}")';
              db.rawInsert(qryParametros);
            } catch (e) {
              print("ERRR >>>");
              print(e);
            }
          }

          return db;
        },
        version: 1,
      );

      return db;
    } catch (e) {
      print("ERRR >>>>");
      print(e);
    }
  }

  deleteDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, database);

    await deleteDatabase(path);
  }
}
