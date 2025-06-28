import 'package:photofiy/core/utils/errors/failure.dart';
import 'package:photofiy/core/utils/usecases/usecase.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';
import 'package:photofiy/features/home/domain/repositories/pixabay_repository.dart';

class ToggleFavoriteUseCase implements UseCase<void, ToggleFavoriteParams> {
  final PixabayRepository repository;

  ToggleFavoriteUseCase(this.repository);

  @override
  Future<Result> call(ToggleFavoriteParams params) async {
    if (repository.isFavorite(params.image.id)) {
      await repository.removeFromFavorites(params.image.id);
    } else {
      await repository.addToFavorites(params.image);
    }
    return Result.success(null);
  }
}

class ToggleFavoriteParams {
  final PixabayImage image;

  ToggleFavoriteParams(this.image);
}

class GetFavoriteImagesUseCase implements UseCase<List<PixabayImage>, NoParams> {
  final PixabayRepository repository;

  GetFavoriteImagesUseCase(this.repository);

  @override
  Future<Result> call(NoParams params) async {
    final favorites = repository.getFavoriteImages();
    return Result.success(favorites);
  }
}
