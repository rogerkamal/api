import 'package:flutter/material.dart';

class UIHelper {
  static InputDecoration getMyTextFieldDecoration({
    required String labelTxt,
    required String hintTxt,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.pinkAccent, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.purple, width: 2),
      ),
      labelText: labelTxt,
      hintText: hintTxt,
      prefixIcon: Icon(prefixIcon),
    );
  }
}
