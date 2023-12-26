import 'package:consulta_teraln/models/enum/enum_classificacao.dart';
import 'package:consulta_teraln/models/modulo.dart';

class Escola{
  int id = 0;
  String razaoSocial = "";
  String nomeEscola = "";
  int idRegistro = 0;
  String nomeRegistro = "";
  bool ativo = false;
  String cidade = "";
  String estado = "";
  int qtdLicenca = 0;
  int qtdMatriculasContratadas = 0;
  List<Modulo> modulos = [];
  String tipoRelacionamento = "";

  EnumeradorClassificacao get classificacao {
    double totalPontos = 0.0;

    modulos.forEach((modulo) {
      if (modulo.nome.contains("Regular") || modulo.nome.contains("Curso")) {
        totalPontos += 5.0;
      } 
      if (modulo.nome == "Smart") {
        totalPontos += 2.0;
      } 
      if (modulo.nome == "NF-e") {
        totalPontos += 0.5;
      }
      if(modulo.nome == "NFS-e"){
        totalPontos += 0.5;
      }
      if(modulo.nome == "NFC-e"){
        totalPontos += 0.5;
      }
      if(modulo.nome == "Portal Professor"){
        totalPontos += 0.5;
      }
    });

    double classificacao = qtdLicenca * totalPontos;

    if(classificacao > 5761){
      return EnumeradorClassificacao.diamante;
    }
    else if(classificacao >= 3361 && classificacao <= 5760){
      return EnumeradorClassificacao.ouro;
    }
    else if(classificacao >= 1360 && classificacao <= 3360){
      return EnumeradorClassificacao.prata;
    }
    else if(classificacao >= 800 && classificacao <= 1360){
      return EnumeradorClassificacao.bronze;
    }
    else{
      return EnumeradorClassificacao.niquel;
    }
    
  }

  Escola(
    this.id, 
    this.razaoSocial,
    this.nomeEscola, 
    this.idRegistro,
    this.nomeRegistro, 
    this.ativo, 
    this.cidade,
    this.estado,
    this.qtdLicenca,
    this.qtdMatriculasContratadas,
    this.modulos,
    this.tipoRelacionamento
    );

  Escola.fromJson(Map<String, dynamic> json){
    id = json['id'];
    razaoSocial = json['razaoSocial'];
    nomeEscola = json['nomeEscola'];
    idRegistro = json['idRegistro'];
    nomeRegistro = json['nomeRegistro'];
    ativo = json['ativo'];
    cidade = json['cidade'];
    estado = json['estado'];
    qtdLicenca = json['qtdLicenca'];
    qtdMatriculasContratadas = json['qtdMatriculasContratadas'];
    if (json['modulos'] != null) {
      modulos = List<Modulo>.from(
          json['modulos'].map((modulo) => Modulo.fromJson(modulo)));
    }
    tipoRelacionamento = json['tipoRelacionamento'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['razaoSocial'] = razaoSocial;
    data['nomeEscola'] = nomeEscola;
    data['idRegistro'] = idRegistro;
    data['nomeRegistro'] = nomeRegistro;
    data['ativo'] = ativo;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['qtdLicenca'] = qtdLicenca;
    data['qtdMatriculasContratadas'] = qtdMatriculasContratadas;
    data['modulos'] = modulos.map((modulo) => modulo.toJson()).toList();
    data['tipoRelacionamento'] = tipoRelacionamento;
    return data;
  }
}