class Audio {
  String _nombre, _fileContent;
  bool _favorito;

  Audio({
    String nombre,
    String fileContent,
    bool favorito,
  }) {
    this._nombre = nombre;
    this._fileContent = fileContent;
    this._favorito = favorito;
  }

  String get nombre => _nombre;
  String get fileContent => _fileContent;
  bool get favorito => _favorito;
}
