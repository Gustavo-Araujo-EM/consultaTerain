import 'package:consulta_teraln/controllers/escola_controller.dart';
import 'package:consulta_teraln/views/components/custom_column_detalhes.dart';
import 'package:flutter/material.dart';
import '../../models/escola_model.dart';

class DetalhesEscolaPage extends StatelessWidget {
  final Escola escola;
  const DetalhesEscolaPage({super.key, required this.escola});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text("Detalhes"),
    ),
    body: SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(EscolaController().obterImagemPelaClassificacao(escola.classificacao), width: 200)
            ),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomColumnDetalhes(label: "Razão Social", fontSize: 18.0, value: escola.razaoSocial),
            CustomColumnDetalhes(label: "Nome da Escola", fontSize: 18.0, value: escola.nomeEscola),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomColumnDetalhes(label: "ID do Registro", fontSize: 18.0, value: escola.idRegistro.toString()),
            CustomColumnDetalhes(label: "Nome do Registro", fontSize: 18.0, value: escola.nomeRegistro),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomColumnDetalhes(label: "Relacionamento", fontSize: 18.0, value: escola.tipoRelacionamento.toString()),
            const CustomColumnDetalhes(label: "fase", fontSize: 18.0, value: "-------------------"),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomColumnDetalhes(label: "Cidade", fontSize: 18.0, value: escola.cidade.toString()),
            CustomColumnDetalhes(label: "UF", fontSize: 18.0, value: escola.estado),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Center(child: CustomColumnDetalhes(label: "Quantidade de Licença", fontSize: 18.0, value: escola.qtdLicenca.toString())),
        const SizedBox(
          height: 12,
        ),
      ],
    ),
    ),
    );
  }
}