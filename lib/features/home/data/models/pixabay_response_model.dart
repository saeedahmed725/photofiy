import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photofiy/features/home/data/models/pixabay_image_model.dart';

part 'pixabay_response_model.freezed.dart';
part 'pixabay_response_model.g.dart';

@freezed
class PixabayResponseModel with _$PixabayResponseModel {
  const factory PixabayResponseModel({
    required int total,
    required int totalHits,
    required List<PixabayImageModel> hits,
  }) = _PixabayResponseModel;

  factory PixabayResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PixabayResponseModelFromJson(json);
}
