import 'package:flutter/material.dart';

class MyConstant {
  // Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeMyService = '/myService';

  // General
  static String appName = 'Ung Connceted';

  // Color
  static Color primary = Color(0xff8069bc);
  static Color dart = Color(0xff513e8b);
  static Color light = Color(0xffb197ef);

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dart,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dart,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dart,
        fontWeight: FontWeight.normal,
      );
}
