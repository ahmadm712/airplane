// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:airplane/utils/utils.dart';

part 'connection_checker_state.dart';

class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  ConnectionCheckerCubit(
    this.connectivity,
    this.connectivityStreamSubscription,
  ) : super(ConnectionCheckerInitial()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emit(
          const ConnectionCheckerConnected(connectionType: ConnectionType.wifi),
        );
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emit(
          const ConnectionCheckerConnected(
            connectionType: ConnectionType.mobile,
          ),
        );
      } else if (connectivityResult == ConnectivityResult.none) {
        emit(
          ConnectionCheckerDisconnected(),
        );
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(ConnectionCheckerConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(ConnectionCheckerDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
