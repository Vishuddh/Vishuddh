// the code below is for creating a class to localize
// our app

import 'package:flutter/cupertino.dart';
import 'package:vishuddh/services/languages.dart';
import 'package:vishuddh/services/languages_classes/english_language.dart';
import 'package:vishuddh/services/languages_classes/hindi_language.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) => _load(locale);

  static Future<Languages> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishLanguage();
      case 'hi':
        return HindiLanguage();
      default:
        return EnglishLanguage();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Languages> old) => false;
}
