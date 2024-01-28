import 'package:equatable/equatable.dart';

import '../../domain/entities/category_entity.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object> get props => [];
}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  final List<CategoryEntity> category;

  const MainScreenLoaded({required this.category});
}

class MainScreenFailure extends MainScreenState {}
