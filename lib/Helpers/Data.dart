import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';

class DataDB {
  static getParametros() {
    var parametros = [
      {
        "clave": "colorBotonSonidos",
        "valor": ColorParser.color(Colors.yellow[300]).toHex(),
      },
      {
        "clave": "colorBotonConfig",
        "valor": ColorParser.color(Colors.yellow[300]).toHex(),
      },
      {
        "clave": "colorBotonSalir",
        "valor": ColorParser.color(Colors.yellow[300]).toHex(),
      },
      {
        "clave": "colorFondoMenu",
        "valor": ColorParser.color(Colors.white).toHex(),
      },
      {
        "clave": "colorFondoSonidos",
        "valor": ColorParser.color(Colors.white).toHex(),
      },
      {
        "clave": "colorFondoConfig",
        "valor": ColorParser.color(Colors.white).toHex(),
      },
      {
        "clave": "colorBarraSuperior",
        "valor": ColorParser.color(Colors.yellow[300]).toHex(),
      },
      {
        "clave": "colorBarraInferior",
        "valor": ColorParser.color(Colors.yellow[300]).toHex(),
      }
    ];

    return parametros;
  }

  static getData() {
    var data = [
      {
        "nombre": "Base",
        "imagen": "",
        "audios": [
          {"nombre": "Amo su inocencia", "favorito": false, "imagen": ""},
          {"nombre": "Amo sus errores", "favorito": false, "imagen": ""},
          {
            "nombre": "A caso no lo viste venir",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "A eso se le llama estrategia",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "A perro traes el omnitrix",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "A veces cuando planeas una cosa",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "Ahora con que pendeja pendejada me vas a salir",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "Ahora sí viene lo chido",
            "favorito": false,
            "imagen": ""
          },
          {"nombre": "Auxilio me desmayo", "favorito": false, "imagen": ""},
          {"nombre": "Awantiaaaa", "favorito": false, "imagen": ""},
          {"nombre": "Bien pensado Woody", "favorito": false, "imagen": ""},
          {"nombre": "Bruhhh", "favorito": false, "imagen": ""},
          {"nombre": "C mamó", "favorito": false, "imagen": ""},
          {"nombre": "Caiste", "favorito": false, "imagen": ""},
          {
            "nombre": "Cállese y tome mi dinero",
            "favorito": false,
            "imagen": ""
          },
          {"nombre": "Es un papucho", "favorito": false, "imagen": ""},
          {
            "nombre": "Ese dia algo cambió dentro de lotso",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre":
                "No tienen el presentimiento de que algo muy malo va a pasar",
            "favorito": false,
            "imagen": ""
          },
          {
            "nombre": "Tú tas pendejo o que hijo",
            "favorito": false,
            "imagen": ""
          },
          {"nombre": "Ba dum tss", "favorito": false, "imagen": ""},
          {"nombre": "Aplausos", "favorito": false, "imagen": ""}
        ]
      },
      {
        "nombre": "Los simpsons",
        "imagen": "",
        "audios": [
          {"nombre": "Aver aver que paso", "favorito": false, "imagen": ""},
          {"nombre": "Esto se va a poner feo", "favorito": false, "imagen": ""},
          {"nombre": "Ay caramba", "favorito": false, "imagen": ""},
          {"nombre": "Homero espia", "favorito": false, "imagen": ""},
          {"nombre": "Llamada de homero", "favorito": false, "imagen": ""},
          {"nombre": "Homero mensaje", "favorito": false, "imagen": ""},
          {"nombre": "Matanga", "favorito": false, "imagen": ""},
          {"nombre": "Don barredora", "favorito": false, "imagen": ""},
          {
            "nombre": "Me quiero volver chango",
            "favorito": false,
            "imagen": ""
          },
          {"nombre": "Ha ha", "favorito": false, "imagen": ""},
          {"nombre": "Puerco araña", "favorito": false, "imagen": ""}
        ]
      }
    ];

    return data;
  }
}
