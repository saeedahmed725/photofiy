import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';
import 'package:photofiy/features/home/domain/usecases/favorite_usecase.dart';
import 'package:photofiy/features/home/domain/usecases/search_images_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchImagesUseCase searchImagesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final GetFavoriteImagesUseCase getFavoriteImagesUseCase;
  final PixabayRepository repository;

  HomeBloc({
    required this.searchImagesUseCase,
    required this.toggleFavoriteUseCase,
    required this.getFavoriteImagesUseCase,
    required this.repository,
  }) : super(const HomeState()) {
    on<LoadInitialImages>(_onLoadInitialImages);
    on<SearchImages>(_onSearchImages);
    on<LoadMoreImages>(_onLoadMoreImages);
    on<RefreshImages>(_onRefreshImages);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadInitialImages(
    LoadInitialImages event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    final result = await searchImagesUseCase(const SearchImagesParams(page: 1));

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (images) => emit(
        state.copyWith(
          status: HomeStatus.success,
          images: images,
          hasReachedMax: images.length < 20,
          currentPage: 1,
        ),
      ),
    );
  }

  Future<void> _onSearchImages(
    SearchImages event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading, searchQuery: event.query));

    final result = await searchImagesUseCase(
      SearchImagesParams(query: event.query, page: 1),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (images) => emit(
        state.copyWith(
          status: HomeStatus.success,
          images: images,
          hasReachedMax: images.length < 20,
          currentPage: 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreImages(
    LoadMoreImages event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;

    final nextPage = state.currentPage + 1;
    final result = await searchImagesUseCase(
      SearchImagesParams(query: state.searchQuery, page: nextPage),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (newImages) {
        final hasReachedMax = newImages.length < 20;
        emit(
          state.copyWith(
            status: HomeStatus.success,
            images: List.of(state.images)..addAll(newImages),
            hasReachedMax: hasReachedMax,
            currentPage: nextPage,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshImages(
    RefreshImages event,
    Emitter<HomeState> emit,
  ) async {
    final result = await searchImagesUseCase(
      SearchImagesParams(query: state.searchQuery, page: 1),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (images) => emit(
        state.copyWith(
          status: HomeStatus.success,
          images: images,
          hasReachedMax: images.length < 20,
          currentPage: 1,
        ),
      ),
    );
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(searchQuery: null, status: HomeStatus.loading));

    add(LoadInitialImages());
  }

  List<String> getSearchHistory() {
    return repository.getSearchHistory();
  }
}
