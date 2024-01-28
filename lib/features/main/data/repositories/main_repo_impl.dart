import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/main_repositories.dart';
import '../datasources/main_remote_data_sources.dart';

class MainRepoImpl implements MainRepoistory {
  final MainRemoteDataSource _remoteDataSource;

  MainRepoImpl(this._remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategory() async =>
      await _remoteDataSource.getCategory();
}
