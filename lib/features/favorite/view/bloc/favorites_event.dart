part of '../../../favorite/view/bloc/favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final PixabayImage image;

  const ToggleFavorite(this.image);

  @override
  List<Object> get props => [image];
}