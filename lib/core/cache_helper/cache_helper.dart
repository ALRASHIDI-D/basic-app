import 'dart:ui';

import 'package:base_app/core/utils/app_consts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  final FlutterSecureStorage storage;

  CacheHelper({required this.storage});

  getLocale() async {
    String languageSelected =
        await storage.read(key: AppConstants.appLocaleKey) ?? 'ar';

    return Locale(languageSelected);
  }

  cacheLanguage(String languageSelected, BuildContext context) async {
    storage.write(key: AppConstants.appLocaleKey, value: languageSelected);
    EasyLocalization.of(context)?.setLocale(Locale(languageSelected));
    context.setLocale(Locale(languageSelected));
    AppConstants.appNavigatorKey.currentContext
        ?.setLocale(Locale(languageSelected));
  }
}
