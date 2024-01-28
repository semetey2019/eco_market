import 'package:eco_market/features/main/presentation/cubit/main_screen_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/main_repositories.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final MainRepoistory _mainRepoistory;
  MainScreenCubit(this._mainRepoistory) : super(MainScreenInitial());

  getCategory() async {
    emit(MainScreenLoading());
    try {
      var list = await _mainRepoistory.getCategory();

      emit(MainScreenLoaded(category: list));
    } catch (e) {
      emit(MainScreenFailure());
    }
  }
}
