import 'package:base_app/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/utils/app_consts.dart';
import 'injection_container.dart' as di;

void main() async {
  FlavorConfig(
      name: AppConstants.appFlavorStaging,
      color: Colors.blueGrey,
      location: BannerLocation.bottomStart,
      variables: {
        AppConstants.appBaseUrlKey: '',
        AppConstants.appFlavorKey: AppConstants.appFlavorStaging,
      });
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  Locale currentLocale = await di.sl<CacheHelper>().getLocale();
  runApp(EasyLocalization(
    child: const MyApp(),
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    startLocale: currentLocale,
    fallbackLocale: currentLocale,
  ));
}

