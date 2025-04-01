import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_service.dart';
import 'ST_Event.dart';
import 'ST_State.dart';

class StatusTrackBloc extends Bloc<StatusTrackEvent, StatusTrackState> {
  final ApiService apiService;
  final String orderId;

  StatusTrackBloc({
    required this.apiService,
    required this.orderId,
  }) : super(StatusTrackState()) {
    on<InitializeTrackStatus>(_onInitialize);
    on<UpdateTrackStatus>(_onUpdateStatus);
  }

  Future<void> _onInitialize(
      InitializeTrackStatus event,
      Emitter<StatusTrackState> emit,
      ) async {
    final status = await apiService.getStatus(orderId);
    emit(state.copyWith(
      currentStatus: status,
    ));
  }

  Future<void> _onUpdateStatus(
      UpdateTrackStatus event,
      Emitter<StatusTrackState> emit,
      ) async {
    await apiService.updateStatus(orderId, event.status);
    emit(state.copyWith(
      currentStatus: event.status,
    ));
  }
}
