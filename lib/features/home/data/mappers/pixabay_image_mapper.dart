import 'package:photofiy/features/home/data/models/pixabay_image_model.dart';
import 'package:photofiy/features/home/domain/entities/pixabay_image.dart';

class PixabayImageMapper {
  static PixabayImage toEntity(PixabayImageModel model) {
    return PixabayImage(
      id: model.id,
      pageURL: model.pageURL,
      type: model.type,
      tags: model.tags,
      previewURL: model.previewURL,
      previewWidth: model.previewWidth,
      previewHeight: model.previewHeight,
      webformatURL: model.webformatURL,
      webformatWidth: model.webformatWidth,
      webformatHeight: model.webformatHeight,
      largeImageURL: model.largeImageURL,
      imageWidth: model.imageWidth,
      imageHeight: model.imageHeight,
      imageSize: model.imageSize,
      views: model.views,
      downloads: model.downloads,
      likes: model.likes,
      comments: model.comments,
      userId: model.user_id,
      user: model.user,
      userImageURL: model.userImageURL,
      fullHDURL: model.fullHDURL,
      imageURL: model.imageURL,
      vectorURL: model.vectorURL,
    );
  }

  static PixabayImageModel toModel(PixabayImage entity) {
    return PixabayImageModel(
      id: entity.id,
      pageURL: entity.pageURL,
      type: entity.type,
      tags: entity.tags,
      previewURL: entity.previewURL,
      previewWidth: entity.previewWidth,
      previewHeight: entity.previewHeight,
      webformatURL: entity.webformatURL,
      webformatWidth: entity.webformatWidth,
      webformatHeight: entity.webformatHeight,
      largeImageURL: entity.largeImageURL,
      imageWidth: entity.imageWidth,
      imageHeight: entity.imageHeight,
      imageSize: entity.imageSize,
      views: entity.views,
      downloads: entity.downloads,
      likes: entity.likes,
      comments: entity.comments,
      user_id: entity.userId,
      user: entity.user,
      userImageURL: entity.userImageURL,
      fullHDURL: entity.fullHDURL,
      imageURL: entity.imageURL,
      vectorURL: entity.vectorURL,
    );
  }

  static List<PixabayImage> toEntityList(List<PixabayImageModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static List<PixabayImageModel> toModelList(List<PixabayImage> entities) {
    return entities.map((entity) => toModel(entity)).toList();
  }
}
