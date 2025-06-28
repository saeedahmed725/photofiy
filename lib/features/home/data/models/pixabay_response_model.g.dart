// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixabayResponseModelImpl _$$PixabayResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PixabayResponseModelImpl(
      total: (json['total'] as num).toInt(),
      totalHits: (json['totalHits'] as num).toInt(),
      hits: (json['hits'] as List<dynamic>)
          .map((e) => PixabayImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PixabayResponseModelImplToJson(
        _$PixabayResponseModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
