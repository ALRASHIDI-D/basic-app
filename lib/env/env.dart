import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class AppEnv {
  @EnviedField(varName: "BASE_URL_STAGING", obfuscate: true)
  static String baseUrlStaging = _AppEnv.baseUrlProd;

  @EnviedField(varName: "BASE_URL_PRODUCTION", obfuscate: true)
  static String baseUrlProd = _AppEnv.baseUrlProd;
}
