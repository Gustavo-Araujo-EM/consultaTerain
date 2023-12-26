import 'package:flutter/material.dart';

class CustomColumnDetalhes extends StatelessWidget {

  final String label;
  final double fontSize;
  final String value;

  const CustomColumnDetalhes({
    super.key, 
    required this.label, 
    required this.fontSize, 
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}