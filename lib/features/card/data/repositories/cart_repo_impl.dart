import '../../domain/entityes/order_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepoImple implements CartRepository {
  final CartRemoteDataSourse _cartRemoteDataSourse;
  CartRepoImple(this._cartRemoteDataSourse);

  @override
  Future<List<OrderEntity>> getOrders() async =>
      await _cartRemoteDataSourse.getOrders();
}
