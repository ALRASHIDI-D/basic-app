import 'package:flutter/material.dart';

class AppConstants {
  //todo change app name
  static const String appName = '';
  static const String appFlavorStaging = 'STAGING';
  static const String appFlavorProduction = 'PRODUCTION';
  static const String appFlavorKey = 'app_flavor';
  static const String appLocaleKey = 'app_locale_key';
  static const String appBaseUrlKey = 'app_base_url';
  static String languageKey = 'language_key';


  static final GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();

  static const double defualtPadding = 12;
  static const double defualtRadius = 20;
}
