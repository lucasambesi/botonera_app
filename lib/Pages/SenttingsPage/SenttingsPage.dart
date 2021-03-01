import 'package:botonera_app/Pages/SenttingsPage/AudioCategoriaSettings.dart';
import 'package:botonera_app/Pages/SenttingsPage/GeneralSettingsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantallaConfiguracion extends StatefulWidget {
  State<StatefulWidget> createState() => PantallaConfiguracionImpl();
}

class PantallaConfiguracionImpl extends State<PantallaConfiguracion> {
  final _tabPages = <Widget>[
    PantallaGeneralSettings(),
    PantallaAudioCategoriaSettings(),
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
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Configuración'),
          backgroundColor: Colors.yellow[300],
          shadowColor: Colors.white,
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabPages,
        ),
      ),
    );
  }
}
