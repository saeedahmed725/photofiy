import 'package:photofiy/core/constants/app_apis.dart';
import 'package:photofiy/core/services/hive_service.dart';
import 'package:photofiy/core/utils/errors/failure.dart';
import 'package:photofiy/features/home/data/datasources/pixabay_remote_data_source.dart';
import 'package:photofiy/features/home/data/mappers/pixabay_image_mapper.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';

class PixabayRepositoryImpl implements PixabayRepository {
  final PixabayRemoteDataSource remoteDataSource;

  PixabayRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<PixabayImage>>> searchImages({
    String? query,
    String imageType = AppApis.defaultImageType,
    String orientation = AppApis.defaultOrientation,
    String category = AppApis.defaultCategory,
    String order = AppApis.defaultOrder,
    bool safeSearch = AppApis.defaultSafeSearch,
    int page = 1,
    int perPage = AppApis.defaultPerPage,
  }) {
    return Failure.handleOperation(
      operation: () async {
        final responseModel = await remoteDataSource.searchImages(
          query: query,
          imageType: imageType,
          orientation: orientation,
          category: category,
          order: order,
          safeSearch: safeSearch,
          page: page,
          perPage: perPage,
        );

        return PixabayImageMapper.toEntityList(responseModel.hits);
      },
      errorMessage: 'Failed to search images',
    );
  }

  @override
  Future<void> addToFavorites(PixabayImage image) async {
    final model = PixabayImageMapper.toModel(image);
    await HiveService.addToFavorites(model);
  }

  @override
  Future<void> removeFromFavorites(int imageId) async {
    await HiveService.removeFromFavorites(imageId);
  }

  @override
  bool isFavorite(int imageId) {
    return HiveService.isFavorite(imageId);
  }

  @override
  List<PixabayImage> getFavoriteImages() {
    final models = HiveService.getFavoriteImages();
    return PixabayImageMapper.toEntityList(models);
  }

  @override
  Stream<void> watchFavorites() {
    return HiveService.watchFavorites().map((_) {});
  }

  @override
  Future<void> addSearchQuery(String query) async {
    await HiveService.addSearchQuery(query);
  }

  @override
  List<String> getSearchHistory() {
    return HiveService.getSearchHistory();
  }

  @override
  Future<void> clearSearchHistory() async {
    await HiveService.clearSearchHistory();
  }
}
