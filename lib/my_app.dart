import 'package:base_app/core/network/cubit/network_cubit.dart';
import 'package:base_app/core/routes/app_routes.dart';
import 'package:base_app/core/utils/app_consts.dart';
import 'package:base_app/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<NetworkCubit>()),
        ],
        child: MaterialApp(
          theme: AppStyle.defualtTheme,
          themeMode: ThemeMode.system,
          darkTheme: AppStyle.defualtTheme,
          onGenerateRoute: AppRoute.onGenerateRoute,
          navigatorKey: AppConstants.appNavigatorKey,
        ));
  }
}
