import 'package:eco_market/features/card/presentation/cubit/cart_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/cart_repository.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartRepository _cartRepository;

  CartScreenCubit(this._cartRepository) : super(CartScreenInitial());
  getOrders() async {
    emit(CartScreenLoading());
    try {
      var list = await _cartRepository.getOrders();
      emit(CartScreenLoaded(orders: list));
    } catch (e) {
      emit(CartScreenFailure());
    }
  }
}
