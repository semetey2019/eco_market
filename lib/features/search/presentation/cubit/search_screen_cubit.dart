import 'package:bloc/bloc.dart';
import 'package:eco_market/features/search/presentation/cubit/search_screen_state.dart';

import '../../domain/repositories/search_repositories.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final SearchRepository _searchrepository;
  SearchScreenCubit(this._searchrepository) : super(SearchScreenInitial());
  getProducts({String? productType, String? search}) async {
    emit(SearchScreenLoading());
    try {
      var list = await _searchrepository.getProducts(
          productType: productType, search: search);
      emit(SearchScreenLoaded(products: list));
    } catch (e) {
      emit(SearchScreenFailure());
    }
  }
}
