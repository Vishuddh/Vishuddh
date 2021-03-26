// the code below is for creating a class that extends languages
// class and provides Hindi language support

import 'package:vishuddh/services/languages.dart';

class HindiLanguage extends Languages {
  // @override
  // String get appName => 'विशुद्ध';

  // @override
  // String get labelInfo => 'स्वागत हे';

  @override
  String get labelSelectLanguage => 'भाषा चुने';

  // @override
  // String get labelWelcome => 'नमस्ते';

  @override
  String get appBarName => 'विशुद्ध';

  // @override
  // String get homeListTile => 'मुख पृष्ठ';
}
