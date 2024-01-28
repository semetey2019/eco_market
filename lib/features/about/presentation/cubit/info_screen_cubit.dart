// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:eco_market/features/about/presentation/cubit/info_screen_state.dart';

class InfoScreenCubit extends Cubit<InfoScreenState> {
  InfoScreenCubit() : super(InfoScreenInitial());
}
