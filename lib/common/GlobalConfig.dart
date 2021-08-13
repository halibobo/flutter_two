import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class GlobalConfig {
  static Color colorPrimary = Colors.green;

  void foo() async {
    Int32 i = 12 as Int32;
    List list = [1,2];

    // var prefs = await SharedPreferences.getInstance();
    // var used = prefs.getBool('used');
    // if (!used) {
    //   prefs.setBool('used', true);
    // }
  }
}