import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:botonera_app/SoundsPage/ButtomCard.dart';
import 'package:flutter/services.dart' show rootBundle;

class FileUtils {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/myFile.txt');
  }

  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data);
  }

  static Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }

  static Future<List<String>> getListaAudios() async {
    final file = await getFile;
    String fileContents = await file.readAsString();

    fileContents.replaceAll("\n", ",");
    List<String> audios = new List<String>();
    audios = fileContents.split(",");

    return audios;
  }

  static Future<List<Widget>> getAudios() async {
    List<Widget> _widgets = new List<Widget>();

    getListaAudios().then(
      (content) {
        for (int i = 0; i < content.length; i++) {
          _widgets.add(
            BotonCard(
              audio: content[i].toString(),
            ),
          );
          i++;
        }
      },
    );
    return _widgets;
  }

  //#region Files en Assets
  static Future<List<Widget>> getAudiosByFileName({String fileName}) async {
    List<Widget> _widgets = new List<Widget>();

    getListaAudiosByFileName(fileName).then(
      (content) {
        for (int i = 0; i < content.length; i++)
          _widgets.add(
            BotonCard(
              audio: content[i].toString(),
            ),
          );
      },
    );
    return _widgets;
  }

  static Future<List<String>> getListaAudiosByFileName(String fileName) async {
    String fileContents = await getFileDataAssets(fileName);

    //fileContents.replaceAll("(\n|\r)", ",");
    List<String> audios = new List<String>();
    audios = fileContents.split(",");

    return audios;
  }

  static Future<String> getFileDataAssets(String fileName) async {
    return await rootBundle.loadString('assets/files/$fileName.txt');
  }
  //#endregion
}
