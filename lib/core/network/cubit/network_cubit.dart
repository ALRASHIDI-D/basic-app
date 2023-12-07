import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final InternetConnectionChecker checker;

  NetworkCubit({required this.checker}) : super(NetworkInitial()) {
    if ((Platform.isAndroid || Platform.isIOS) && !kIsWeb) {
      monitorInternetConnection();
    }
  }

  StreamSubscription? internetConnectionStreamSubscription;
  bool showConnected = false;
  void monitorInternetConnection() async {
    internetConnectionStreamSubscription =
        checker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emit(NetworkConnected(showConnected: showConnected));

          showConnected = false;
          break;
        case InternetConnectionStatus.disconnected:
          showConnected = true;
          emit(NetworkDisConnected());
          break;
      }
    });
  }
}
