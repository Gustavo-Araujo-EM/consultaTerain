import 'package:consulta_teraln/views/components/custom_button.dart';
import 'package:flutter/material.dart';
import '../../models/escola_model.dart';
import '../../controllers/escola_controller.dart';
import '../components/list.dart';
import '../components/loading.dart';
import '../components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Escola> _escolas = <Escola>[];
  final List<Escola> _escolasInativas = <Escola>[];
  final List<Escola> _escolasAtivas = <Escola>[];
  List<Escola> _escolasAtivasDisplay = <Escola>[];
  List<Escola> _escolasInativasDisplay = <Escola>[];

  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    EscolaController().buscarEscolas().then((value) {
      setState(() {
        _isLoading = false;
        _escolas.addAll(value);
        _escolasInativas.addAll(value.where((e) => e.ativo == false));
        _escolasInativasDisplay = _escolasInativas;
        _escolasAtivas.addAll(value.where((e) => e.ativo == true));
        _escolasAtivasDisplay = _escolasAtivas;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Escolas'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Ativos", style: TextStyle(color: Colors.green)),
              ),
              Tab(
                child: Text("Inativos", style: TextStyle(color: Colors.red)),
              ),
            ],
            labelColor: Color.fromARGB(255, 255, 255, 255), // Cor do texto da Tab selecionada
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  itemBuilder: (context, index){
                    if(!_isLoading){
                      return index == 0 ? Row(
                        children: [ Expanded(
                          child: MySearch(
                            hintText: "Digite o nome do cliente",
                            onChange: (searchText){
                              searchText = searchText.toLowerCase();
                              setState(() {
                                _escolasAtivasDisplay = _escolasAtivas.where((u) {
                                  var nameLowerCase = EscolaController().removerAcentos(u.nomeEscola.toLowerCase().trim());
                                  return nameLowerCase.contains(EscolaController().removerAcentos(searchText.trim()));                    
                                }).toList();
                              });
                            },
                          ),
                        ),
                         const CustomButton(iconeBotao: Icon(Icons.filter_alt))
                        ]
                      ) : MyList(escola: _escolasAtivasDisplay[index - 1]);
                    } else {
                      return const MyLoading();
                    }
                },
                  itemCount: _escolasAtivasDisplay.length + 1,
                ),
              ),
            ),
             Scaffold(
              body: SafeArea(
                child: ListView.builder(
                  itemBuilder: (context, index){
                    if(!_isLoading){
                      return index == 0 ? MySearch(
                        hintText: "Digite o nome do cliente",
                        onChange: (searchText){
                          searchText = searchText.toLowerCase();
                          setState(() {
                            _escolasInativasDisplay = _escolasInativas.where((u) {
                              var nameLowerCase = u.nomeEscola.toLowerCase();
                              return nameLowerCase.contains(searchText);                    
                            }).toList();
                          });
                        },
                      ) : MyList(escola: _escolasInativasDisplay[index - 1]);
                    } else {
                      return const MyLoading();
                    }
                },
                  itemCount: _escolasInativasDisplay.length + 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//           itemBuilder: (context, index){
//             if(!_isLoading){
//               return index == 0 ? MySearch(
//                 hintText: "Digite o nome do cliente",
//                 onChange: (searchText){
//                   searchText = searchText.toLowerCase();
//                   setState(() {
//                     _escolasDisplay = _escolas.where((u) {
//                       var nameLowerCase = u.nomeEscola.toLowerCase();
//                       return nameLowerCase.contains(searchText);                    
//                     }).toList();
//                   });
//                 },
//               ) : MyList(escola: _escolasDisplay[index - 1]);
//             } else {
//               return const MyLoading();
//             }
//         },
//           itemCount: _escolasDisplay.length + 1,
//         ),
//       ),
//     );
//   }
// }
