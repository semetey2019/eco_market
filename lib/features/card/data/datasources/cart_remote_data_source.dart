import 'package:dio/dio.dart';

import '../../../../core/error/exseption.dart';
import '../models/order_models.dart';

abstract class CartRemoteDataSourse {
  Future<List<OrderModel>> getOrders();
}

class CartRemoteDataSourseImple implements CartRemoteDataSourse {
  final Dio _dio;

  CartRemoteDataSourseImple(this._dio);
  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      var response = await _dio.get(
        'https://neobook.online/ecobak/order-list/',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data.map((e) => OrderModel.fromJson(e)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
