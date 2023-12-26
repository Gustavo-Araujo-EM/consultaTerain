import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {

  final void Function(String)? onChange;
  final String? hintText;
  final Icon? iconeBotao;

  const MySearch({super.key, this.onChange, this.hintText, this.iconeBotao});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        autofocus: false,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}