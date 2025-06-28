import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pixabay_image_model.freezed.dart';
part 'pixabay_image_model.g.dart';

@freezed
@HiveType(typeId: 0)
class PixabayImageModel with _$PixabayImageModel {
  const factory PixabayImageModel({
    @HiveField(0) required int id,
    @HiveField(1) required String pageURL,
    @HiveField(2) required String type,
    @HiveField(3) required String tags,
    @HiveField(4) required String previewURL,
    @HiveField(5) required int previewWidth,
    @HiveField(6) required int previewHeight,
    @HiveField(7) required String webformatURL,
    @HiveField(8) required int webformatWidth,
    @HiveField(9) required int webformatHeight,
    @HiveField(10) required String largeImageURL,
    @HiveField(11) required int imageWidth,
    @HiveField(12) required int imageHeight,
    @HiveField(13) required int imageSize,
    @HiveField(14) required int views,
    @HiveField(15) required int downloads,
    @HiveField(16) required int likes,
    @HiveField(17) required int comments,
    @HiveField(18) required int user_id,
    @HiveField(19) required String user,
    @HiveField(20) required String userImageURL,
    @HiveField(21) String? fullHDURL,
    @HiveField(22) String? imageURL,
    @HiveField(23) String? vectorURL,
  }) = _PixabayImageModel;

  factory PixabayImageModel.fromJson(Map<String, dynamic> json) =>
      _$PixabayImageModelFromJson(json);
}
