import 'package:flutter/material.dart';

const appColor = Color(0xFF01B4E4);

abstract class AppButtonStyle {
  static final linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(appColor),
    textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
  );
}
