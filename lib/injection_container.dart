import 'package:base_app/core/api_helper/api_consumer.dart';
import 'package:base_app/core/api_helper/dio_provider.dart';
import 'package:base_app/core/cache_helper/cache_helper.dart';
import 'package:base_app/core/network/cubit/network_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InjectionContainer {}

final sl = GetIt.instance;

Future<void> init() async {
  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final secureLocalStorage =
      FlutterSecureStorage(aOptions: getAndroidOptions());

  // ------------------------------------------------------CORE------------------------------------------------------
  sl.registerFactory<NetworkCubit>(() => NetworkCubit(checker: sl()));

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  sl.registerLazySingleton<FlutterSecureStorage>(() => secureLocalStorage);
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper(storage: sl()));
  sl.registerLazySingleton<ApiConsumer>(
      () => DioProvider(client: sl(), cacheHelper: sl()));

  // ------------------------------------------------------CUBITS------------------------------------------------------
}
