part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadInitialImages extends HomeEvent {}

class SearchImages extends HomeEvent {
  final String query;

  const SearchImages(this.query);

  @override
  List<Object> get props => [query];
}

class LoadMoreImages extends HomeEvent {}


class RefreshImages extends HomeEvent {}

class ClearSearch extends HomeEvent {}
