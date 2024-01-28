// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/entites/product_entity.dart';
import '../../domain/repositories/search_repositories.dart';
import '../datasources/search_remote_data_sourse.dart';

class SearchRepoImple implements SearchRepository {
  final SearchRemoteDataSourse _remoteDataSourse;
  SearchRepoImple(this._remoteDataSourse);
  @override
  Future<List<ProductEntity>> getProducts(
          {String? productType, String? search}) async =>
      await _remoteDataSourse.getProducts(
          productType: productType, search: search);
}
