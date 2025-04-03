import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'CN_State.dart';

class CustomNotificationCubit extends Cubit<CustomNotificationState> {
  Timer? _timer;

  CustomNotificationCubit() : super(CustomNotificationState());

  void showNotification(double closeTime) {
    emit(state.copyWith(isVisible: true));

    if (closeTime > 0) {
      _timer?.cancel();
      _timer = Timer(Duration(seconds: closeTime.round()), () {
        hideNotification();
      });
    }
  }

  void hideNotification() {
    _timer?.cancel();
    emit(state.copyWith(isVisible: false));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}