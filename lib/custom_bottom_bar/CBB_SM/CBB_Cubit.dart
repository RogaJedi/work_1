import 'package:flutter_bloc/flutter_bloc.dart';

import 'CBB_State.dart';

class CustomBottomBarCubit extends Cubit<CustomBottomBarState> {
  CustomBottomBarCubit() : super(CustomBottomBarState(selectedIndex: 0));

  void updateIndex(int index) {
    emit(CustomBottomBarState(selectedIndex: index));
  }
}