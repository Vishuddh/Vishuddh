// the code below is for creating a class that extends languages
// class and provides english language support

import 'package:vishuddh/services/languages.dart';

class EnglishLanguage extends Languages {
  // the code below is for displaying the name of app in english
  // @override
  // String get appName => "Vishuddh";

  // @override
  // String get labelInfo => 'Welcome';

  @override
  String get labelSelectLanguage => 'Select Language';

  // @override
  // String get labelWelcome => 'Hello';

  @override
  String get appBarName => 'Vishuddh';

  // @override
  // String get homeListTile => 'Home Page';
}
