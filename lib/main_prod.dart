import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'core/utils/app_consts.dart';
import 'my_app.dart';

void main() {
  FlavorConfig(
      name: AppConstants.appFlavorProduction,
      color: Colors.red,
      location: BannerLocation.bottomStart,
      variables: {
        AppConstants.appBaseUrlKey: '',
        AppConstants.appFlavorKey: AppConstants.appFlavorProduction,
      });
  runApp(const MyApp());
}
