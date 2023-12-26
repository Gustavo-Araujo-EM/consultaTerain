class Modulo{
  int id = 0;
  String nome = "";

  Modulo(this.id, this.nome);

  Modulo.fromJson(Map<String, dynamic> json) {
    id =  int.parse(json['moduloId'].toString());
    nome = json['nomeModulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moduloId'] = id;
    data['nomeModulo'] = nome;
    return data;
  }

}