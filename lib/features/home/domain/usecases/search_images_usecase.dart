import 'package:equatable/equatable.dart';
import 'package:photofiy/core/constants/app_apis.dart';
import 'package:photofiy/core/utils/errors/failure.dart';
import 'package:photofiy/core/utils/usecases/usecase.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';

class SearchImagesUseCase implements UseCase<List<PixabayImage>, SearchImagesParams> {
  final PixabayRepository repository;

  SearchImagesUseCase(this.repository);

  @override
  Future<Result> call(SearchImagesParams params) async {
    final result = await repository.searchImages(
      query: params.query,
      imageType: params.imageType,
      orientation: params.orientation,
      category: params.category,
      order: params.order,
      safeSearch: params.safeSearch,
      page: params.page,
      perPage: params.perPage,
    );

    // Add to search history if query is not empty
    if (params.query != null && params.query!.isNotEmpty) {
      await repository.addSearchQuery(params.query!);
    }

    return result;
  }
}

class SearchImagesParams extends Equatable {
  final String? query;
  final String imageType;
  final String orientation;
  final String category;
  final String order;
  final bool safeSearch;
  final int page;
  final int perPage;

  const SearchImagesParams({
    this.query,
    this.imageType = AppApis.defaultImageType,
    this.orientation = AppApis.defaultOrientation,
    this.category = AppApis.defaultCategory,
    this.order = AppApis.defaultOrder,
    this.safeSearch = AppApis.defaultSafeSearch,
    this.page = 1,
    this.perPage = AppApis.defaultPerPage,
  });

  SearchImagesParams copyWith({
    String? query,
    String? imageType,
    String? orientation,
    String? category,
    String? order,
    bool? safeSearch,
    int? page,
    int? perPage,
  }) {
    return SearchImagesParams(
      query: query ?? this.query,
      imageType: imageType ?? this.imageType,
      orientation: orientation ?? this.orientation,
      category: category ?? this.category,
      order: order ?? this.order,
      safeSearch: safeSearch ?? this.safeSearch,
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
    );
  }

  @override
  List<Object?> get props => [
        query,
        imageType,
        orientation,
        category,
        order,
        safeSearch,
        page,
        perPage,
      ];
}
