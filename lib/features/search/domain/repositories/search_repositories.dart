import '../entites/product_entity.dart';

abstract class SearchRepository {
  Future<List<ProductEntity>> getProducts(
      {String? productType, String? search});
}
