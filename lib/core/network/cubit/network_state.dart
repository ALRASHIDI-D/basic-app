part of 'network_cubit.dart';

sealed class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

final class NetworkInitial extends NetworkState {}

final class NetworkConnected extends NetworkState {
  final bool showConnected;

  const NetworkConnected({required this.showConnected});
}

final class NetworkDisConnected extends NetworkState {}
