// the code below is used to create an abstract class which contains
// all localized strings

import 'package:flutter/cupertino.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  // String get appName;

  // String get labelWelcome;

  // String get labelInfo;

  String get labelSelectLanguage;

  // the line of code below is used to change
  // the name of the appbar
  String get appBarName;

  // the property below is used to change the
  // name of the home page in the side navigation
  // bar
  // String get homeListTile;
}
