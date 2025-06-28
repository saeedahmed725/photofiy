part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<PixabayImage> images;
  final String? searchQuery;
  final bool hasReachedMax;
  final int currentPage;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.images = const [],
    this.searchQuery,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<PixabayImage>? images,
    String? searchQuery,
    bool? hasReachedMax,
    int? currentPage,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      images: images ?? this.images,
      searchQuery: searchQuery ?? this.searchQuery,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        images,
        searchQuery,
        hasReachedMax,
        currentPage,
        errorMessage,
      ];
}
