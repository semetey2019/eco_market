import '../entityes/order_entity.dart';

abstract class CartRepository {
  Future<List<OrderEntity>> getOrders();
}
