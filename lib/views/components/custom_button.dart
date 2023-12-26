import 'package:consulta_teraln/views/components/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final Icon iconeBotao;
  final double? height;

  const CustomButton({super.key, required this.iconeBotao, this.height});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 56,
      child: ElevatedButton(
        onPressed: () => 
          showModalBottomSheet(context: context, builder: (_){
          return ModalBottomSheet();
        }),
        child: widget.iconeBotao,
      ),
    );       
  }
}