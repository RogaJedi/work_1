import 'package:work_1/product_card/PC_SM/PC_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCardCubit extends Cubit<ProductCardState> {
  ProductCardCubit(super.initialState);

  void toggleFavorite() {
    emit(state.copyWith(favorite: !state.favorite));
  }

}