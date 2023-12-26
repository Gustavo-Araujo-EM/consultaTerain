import 'package:flutter/material.dart';

class CustomDropDownButtonFormField extends StatefulWidget {

  final String value;
  final ValueNotifier<String> dropValue;
  final String nome;
  final Icon? icone;

  const CustomDropDownButtonFormField({
    super.key,
    required this.value, required this.dropValue, required this.dropOpcoes, required this.nome, this.icone,
  });

  final List<String> dropOpcoes;

  @override
  State<CustomDropDownButtonFormField> createState() => _CustomDropDownButtonFormFieldState();
}

class _CustomDropDownButtonFormFieldState extends State<CustomDropDownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      icon: widget.icone ?? const Icon(Icons.arrow_drop_down),
      dropdownColor: Colors.white,
      iconEnabledColor: Colors.red,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        focusColor: Colors.black,
        label: Text(widget.nome),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))
      ),
      style: const TextStyle(color: Colors.black,fontSize: 20),
      hint: const Text("Selecione", style: TextStyle(color: Colors.black)),
      value: (widget.value.isEmpty) ? null : widget.value,
      onChanged: (value) => widget.dropValue.value = value.toString(),
      items: widget.dropOpcoes.map((opcao) => DropdownMenuItem(
        value: opcao,
        child: Text(opcao),
      )).toList(),
    );
  }
}
