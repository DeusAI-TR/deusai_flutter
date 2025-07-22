import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final String text;
  const FormDivider({super.key, this.text = 'ya da'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text, style: TextStyle(color: Colors.white.withOpacity(0.7))),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
} 