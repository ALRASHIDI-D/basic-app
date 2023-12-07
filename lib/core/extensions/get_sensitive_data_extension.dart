import 'package:base_app/core/utils/app_consts.dart';
import 'package:base_app/env/env.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

extension GetSensitiveDataExtension on String {
  bool isProductionFlavor() {
    String appFlavor =
        FlavorConfig.instance.variables[AppConstants.appFlavorKey];

    return appFlavor.toLowerCase() ==
        AppConstants.appFlavorProduction.toLowerCase();
  }

  String getBaseUrl() {
    bool isProductoin = isProductionFlavor();
    if (isProductoin) {
      return AppEnv.baseUrlProd;
    } else {
      return AppEnv.baseUrlStaging;
    }
  }
}
