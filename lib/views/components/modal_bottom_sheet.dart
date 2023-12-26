import 'package:consulta_teraln/views/components/custom_dropdownformfield.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {

  final dropValue = ValueNotifier("");

  final dropOpcoes = ["Goiânia", "Montalvânia"];

  ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height / 2,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: 53,
              height: 8,
              decoration: BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(8)
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Filtros", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ValueListenableBuilder(valueListenable: dropValue, builder: (context, value, child){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: CustomDropDownButtonFormField(
                            value: value,
                            dropValue: dropValue , 
                            dropOpcoes: dropOpcoes,  
                            nome : "Cidade",
                            icone: const Icon(Icons.location_city)),
                        );
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}