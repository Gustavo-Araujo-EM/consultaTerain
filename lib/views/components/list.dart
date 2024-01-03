import 'package:flutter/material.dart';
import '../../controllers/escola_controller.dart';
import '../../models/escola_model.dart';
import '../pages/detalhes_escola_page.dart';

class MyList extends StatelessWidget {
  final Escola escola;
  const MyList({super.key, required this.escola});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ListTile(
            leading: Hero(tag: escola.id, 
            child: CircleAvatar(
              backgroundImage: AssetImage(EscolaController().obterImagemPelaClassificacao(escola.classificacao)),
              backgroundColor: Colors.black,
            )
          ),
          title: Text(escola.nomeEscola),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(escola.idRegistro.toString()),
              Text(escola.cidade), 
            ],
          ),
          trailing: const Icon(Icons.info_outline),
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => 
            DetalhesEscolaPage(escola: escola)
            )),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
