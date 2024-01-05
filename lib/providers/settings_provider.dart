import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String curLocale = "en";

  void setCurLocale(String newLocale){
    curLocale = newLocale;
    notifyListeners();
  }
}