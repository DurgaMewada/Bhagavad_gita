
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Modal/gita_modal.dart';
import '../utils/Global/global.dart';

class GitaProvider extends ChangeNotifier {
  List<GitaModal> gitaModalList = [];
  String selectLanguage='';

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/gita.json');
    List response = jsonDecode(json);
    gitaModalList = response
        .map(
          (e) => GitaModal.fromJson(e),
    )
        .toList();
    notifyListeners();
  }

  GitaProvider(){
    jsonParsing();
  }

   void languageTranslate(String value) {
     selectLanguage = value;
     notifyListeners();
  }
}