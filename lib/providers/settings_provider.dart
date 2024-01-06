import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String curLocale = "en";
  ThemeMode curMode = ThemeMode.light;


  void setCurMode(ThemeMode themeMode){
    curMode = themeMode;
    notifyListeners();
  }

  bool isLightMode() => curMode == ThemeMode.light;

  void setCurLocale(String newLocale){
    curLocale = newLocale;
    notifyListeners();
  }
}