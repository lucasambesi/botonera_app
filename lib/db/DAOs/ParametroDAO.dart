import 'package:botonera_app/db/OperationsDB.dart';
import 'package:botonera_app/models/Parametro.dart';
import 'package:sqflite/sqflite.dart';

class ParametroDAO {
  static Future<void> updateParametro(Parametro parametro) async {
    Database database = await OperationsDB.openDB();

    return database.update(
      "Parametro",
      parametro.toMap(),
      where: 'id = ?',
      whereArgs: [parametro.id],
    );
  }

  static Future<List<Parametro>> getParametros() async {
    Database database = await OperationsDB.openDB();
    final List<Map<String, dynamic>> parametrosMap =
        await database.query('Parametro');

    return ParametroDAO._toParametroList(parametrosMap);
  }

  static Future<Parametro> getParametro(String clave) async {
    Database database = await OperationsDB.openDB();
    List<Map> list = await database
        .rawQuery('SELECT * FROM Parametro WHERE clave = "$clave"');

    return ParametroDAO._toParametro(list.first);
  }

  //#region Conversores

  static Future<List<Parametro>> _toParametroList(
      List<Map<String, dynamic>> parametroMap) async {
    List<Parametro> parametros = List<Parametro>();

    for (int i = 0; i < parametroMap.length; i++) {
      Parametro parametro = await _toParametro(parametroMap[i]);
      parametros.add(parametro);
    }

    return parametros;
  }

  static Future<Parametro> _toParametro(
      Map<String, dynamic> parametroMap) async {
    Parametro parametro = Parametro(
      id: parametroMap['id'],
      clave: parametroMap['clave'],
      valor: parametroMap['valor'],
    );

    return parametro;
  }

  //#endregion
}
