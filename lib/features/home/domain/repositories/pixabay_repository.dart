import 'package:photofiy/core/utils/errors/failure.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';

abstract class PixabayRepository {
  Future<Result<List<PixabayImage>>> searchImages({
    String? query,
    String imageType,
    String orientation,
    String category,
    String order,
    bool safeSearch,
    int page,
    int perPage,
  });

  // Favorites operations
  Future<void> addToFavorites(PixabayImage image);
  Future<void> removeFromFavorites(int imageId);
  bool isFavorite(int imageId);
  List<PixabayImage> getFavoriteImages();
  Stream<void> watchFavorites();

  // Search history operations
  Future<void> addSearchQuery(String query);
  List<String> getSearchHistory();
  Future<void> clearSearchHistory();
}
