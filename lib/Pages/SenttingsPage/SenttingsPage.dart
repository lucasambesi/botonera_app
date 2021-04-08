import 'package:botonera_app/Helpers/Helpers.dart';
import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings/AudioCategoriaSettingsPage.dart';
import 'package:botonera_app/Pages/SenttingsPage/GeneralSettings/GeneralSettingsPage.dart';
import 'package:botonera_app/models/ParametrosProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PantallaConfiguracion extends StatefulWidget {
  State<StatefulWidget> createState() => _PantallaConfiguracionState();
}

class _PantallaConfiguracionState extends State<PantallaConfiguracion> {
  final _tabPages = <Widget>[
    PantallaGeneralSettings(),
    AudioCategoriaSettings(),
  ];

  final _tabs = <Tab>[
    const Tab(
      icon: Icon(Icons.settings),
      text: 'General',
    ),
    const Tab(
      icon: Icon(Icons.audiotrack),
      text: 'Audios y categorias',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var paramsProvider = Provider.of<ParametrosProvider>(context);
    Color color = Helpers.getColorByParam(paramsProvider.colorBarraSuperior);
    Color colorConstaste =
        Helpers.getColorConstrastByParam(paramsProvider.colorBarraSuperior);
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: colorConstaste),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Configuración',
            style: TextStyle(
              color: colorConstaste,
            ),
          ),
          backgroundColor: color,
          shadowColor: color,
          bottom: TabBar(
            tabs: _tabs,
            labelColor: colorConstaste,
            indicatorColor: colorConstaste,
          ),
        ),
        body: Padding(
          child: TabBarView(
            children: _tabPages,
          ),
          padding: EdgeInsets.only(top: 8.0),
        ),
      ),
    );
  }
}
