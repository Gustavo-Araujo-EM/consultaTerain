import 'dart:convert';
import 'package:consulta_teraln/models/enum/enum_classificacao.dart';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import '../models/escola_model.dart';


class EscolaController{

static const String url = "https://6345b3cf745bd0dbd36f6dd5.mockapi.io/person";

static const String jsonData = ''' 
  [
  {
    "id": 1,
    "razaoSocial": "Expressao - LTDA",
    "nomeEscola": "Colégio Expressão",
    "idRegistro": 900000180,
    "nomeRegistro": "Expressão",
    "ativo": true,
    "cidade": "Cidade A",
    "estado": "Estado A",
    "qtdLicenca": 7000,
    "qtdMatriculasContratadas": 100,
    "modulos": [
      {
        "moduloId": 1,
        "nomeModulo": "Regular/Curso"
      },
      {
        "moduloId": 2,
        "nomeModulo": "Smart"
      }
    ],
    "tipoRelacionamento": "Relacionamento A"
  },
   {
    "id": 2,
    "razaoSocial": "SÃO GONÇALO - LTDA",
    "nomeEscola": "Colégio SÃO GONÇALO",
    "idRegistro": 900000230,
    "nomeRegistro": "ALCANTARA",
    "ativo": true,
    "cidade": "Cidade A",
    "estado": "Estado A",
    "qtdLicenca": 7000,
    "qtdMatriculasContratadas": 100,
    "modulos": [
      {
        "moduloId": 1,
        "nomeModulo": "Regular/Curso"
      },
      {
        "moduloId": 2,
        "nomeModulo": "Smart"
      }
    ],
    "tipoRelacionamento": "Relacionamento A"
  },
  {
    "id": 3,
    "razaoSocial": "Colégio M3 - LTDA",
    "nomeEscola": "Colégio M3",
    "idRegistro": 900000296,
    "nomeRegistro": "UNIDADE SÃO GONÇALO",
    "ativo": false,
    "cidade": "Cidade B",
    "estado": "Estado B",
    "qtdLicenca": 15,
    "qtdMatriculasContratadas": 150,
    "modulos": [
      {
        "moduloId": 3,
        "nomeModulo": "Portal Professor"
      },
      {
        "moduloId": 4,
        "nomeModulo": "Regular/Curso"
      }
    ],
    "tipoRelacionamento": "Relacionamento B"
  },
  {
    "id": 4,
    "razaoSocial": "Escola Interamerica - LTDA",
    "nomeEscola": "ESCOLA INTERAMERICA ",
    "idRegistro": 900000229,
    "nomeRegistro": "UNID. JD AMERICA",
    "ativo": false,
    "cidade": "Cidade B",
    "estado": "Estado B",
    "qtdLicenca": 15,
    "qtdMatriculasContratadas": 150,
    "modulos": [
      {
        "moduloId": 3,
        "nomeModulo": "Portal Professor"
      },
      {
        "moduloId": 4,
        "nomeModulo": "Regular/Curso"
      }
    ],
    "tipoRelacionamento": "Relacionamento B"
  }
]
''';


  List<Escola> parseEscola(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    var escolas = list.map((e) => Escola.fromJson(e)).toList();
    return escolas;
  }
  
  String obterImagemPelaClassificacao(EnumeradorClassificacao classificacao) {
    switch (classificacao) {
      case EnumeradorClassificacao.diamante:
        return 'assets/images/diamante.png';
      case EnumeradorClassificacao.ouro:
        return 'assets/images/ouro.png';
      case EnumeradorClassificacao.prata:
        return "assets/images/prata.png";
      case EnumeradorClassificacao.bronze:
        return 'assets/images/bronze.jpg';
      case EnumeradorClassificacao.niquel:
        return 'assets/images/niquel.jpg';
    }
  }

  String removerAcentos(String str) {
    var comAcento = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var semAcento = 'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz'; 

    for (int i = 0; i < comAcento.length; i++) {      
      str = str.replaceAll(comAcento[i], semAcento[i]);
    }
    return str;
  }

Future<List<Escola>> buscarEscolas() async{ 

  // final http.Response response = await http.get(Uri.parse(url));

  return await compute(parseEscola, jsonData);
}

}



