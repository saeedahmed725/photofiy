import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/core/utils/usecases/usecase.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';
import 'package:photofiy/features/home/domain/usecases/favorite_usecase.dart';

part '../../../favorite/view/bloc/favorites_event.dart';
part '../../../favorite/view/bloc/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteImagesUseCase getFavoriteImagesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final PixabayRepository repository;

  FavoritesBloc({
    required this.getFavoriteImagesUseCase,
    required this.toggleFavoriteUseCase,
    required this.repository,
  }) : super(const FavoritesState()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: FavoritesStatus.loading));

      final result = await getFavoriteImagesUseCase.call(NoParams());

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: FavoritesStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (favorites) => emit(
          state.copyWith(status: FavoritesStatus.success, favorites: favorites),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FavoritesStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    await toggleFavoriteUseCase(ToggleFavoriteParams(event.image));
    final updatedImages = state.favorites.map((image) {
      if (image.id == event.image.id) {
        return image;
      }
      return image;
    }).toList();

    emit(state.copyWith(favorites: updatedImages));
  }

  bool isFavorite(int imageId) {
    return repository.isFavorite(imageId);
  }
}
