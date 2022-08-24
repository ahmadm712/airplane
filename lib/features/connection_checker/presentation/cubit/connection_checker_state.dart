part of 'connection_checker_cubit.dart';

abstract class ConnectionCheckerState extends Equatable {
  const ConnectionCheckerState();

  @override
  List<Object> get props => [];
}

class ConnectionCheckerInitial extends ConnectionCheckerState {}

class ConnectionCheckerLoading extends ConnectionCheckerState {}

class ConnectionCheckerConnected extends ConnectionCheckerState {
  final ConnectionType connectionType;

  const ConnectionCheckerConnected({required this.connectionType});

  @override
  List<Object> get props => [connectionType];
}

class ConnectionCheckerDisconnected extends ConnectionCheckerState {}
