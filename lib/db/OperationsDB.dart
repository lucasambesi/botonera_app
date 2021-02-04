import 'dart:async';
import 'dart:io';
import 'package:botonera_app/models/Audio.dart';
import 'package:botonera_app/models/Categoria.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

//#region Constantes
const database = 'test4.db';
//#endregion

//#region Datos
var data = [
  {
    "nombre": "base",
    "imagen": "",
    "audios": [
      {"nombre": "Aver aver que paso", "favorito": false, "imagen": ""},
      {"nombre": "Amo su inocencia", "favorito": false, "imagen": ""},
      {"nombre": "Amo sus errores", "favorito": false, "imagen": ""},
      {"nombre": "A caso no lo viste venir", "favorito": false, "imagen": ""}
    ]
  }
];
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

          //Juego
          qry = "CREATE TABLE IF NOT EXISTS Audio("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "nombre TEXT,"
              "favorito BIT,"
              "imagen TEXT,"
              "categoria INTEGER NOT NULL,"
              "FOREIGN KEY(categoria) REFERENCES Categoria(id)"
              ")";

          db.execute(qry);

          for (var i = 0; i < data.length; i++) {
            try {
              Categoria categoria = new Categoria(
                  id: i + 1,
                  nombre: data[i]["nombre"],
                  imagen: data[i]["imagen"]);
              List<Map> audios = data[i]["audios"];

              var qry =
                  'INSERT INTO Categoria(nombre,imagen) VALUES("${categoria.nombre}","${categoria.imagen}")';
              db.rawInsert(qry);

              for (var c = 0; c < audios.length; c++) {
                Audio audio = new Audio(
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