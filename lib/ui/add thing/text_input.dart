import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';

class TextInput extends StatelessWidget {
  String inputText;
  TextInput({required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        color: ColorManager.secondary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
