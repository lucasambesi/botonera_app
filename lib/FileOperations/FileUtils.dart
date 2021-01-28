import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:botonera_app/SoundsPage/ButtomCard.dart';
import 'package:botonera_app/models/Audio.dart';

class FileUtils {
  //#region Metodos principales

  static Future<String> getFileDataAssets(String file) async {
    try {
      return await rootBundle.loadString('assets/files/$file.txt');
    } catch (e) {
      return "Falla de lectura de archivo";
    }
  }

  static Future<List<String>> getListaAudiosByFileName(String file) async {
    String fileContents = await getFileDataAssets(file);

    List<String> audios = new List<String>();
    audios = fileContents.split(",");

    return audios;
  }

  //#endregion

  //#region Favoritos

  static Future<List<Audio>> getAudiosFavoritos() async {
    List<Audio> _audios = new List<Audio>();

    getListaAudiosByFileName('favoritos').then(
      (listaFavoritos) {
        for (int i = 0; i < listaFavoritos.length; i++) {
          _audios.add(
            new Audio(
              nombre: listaFavoritos[i].toString(),
            ),
          );
        }
      },
    );
    return _audios;
  }

  //#endregion

  //#region Files en Assets

  static Future<List<Widget>> getAudiosByFileName({String file}) async {
    List<Widget> _widgets = new List<Widget>();
    getListaAudiosByFileName('favoritos').then((listaFavoritos) {
      getListaAudiosByFileName(file).then(
        (listaFile) {
          for (int i = 0; i < listaFile.length; i++) {
            _widgets.add(
              BotonCard(
                audio: new Audio(
                  nombre: listaFile[i].toString(),
                  fileContent: file,
                  favorito: _estaEnfavoritos(
                      listaFavoritos.toList(), listaFile[i].toString()),
                ),
              ),
            );
          }
        },
      );
    });

    return _widgets;
  }

  //#endregion

  //#region Metodos Auxiliares

  static bool _estaEnfavoritos(List<String> listaFavoritos, String audio) {
    Iterator iterator = listaFavoritos.iterator;
    bool enFavoritos = false;

    while (iterator.moveNext()) {
      var iteratorItem = iterator.current;
      if (iteratorItem == audio) {
        enFavoritos = true;
        break;
      }
    }
    return enFavoritos;
  }

  //#endregion
}
