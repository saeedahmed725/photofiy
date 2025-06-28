// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PixabayImageModelAdapter extends TypeAdapter<PixabayImageModel> {
  @override
  final int typeId = 0;

  @override
  PixabayImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PixabayImageModel(
      id: fields[0] as int,
      pageURL: fields[1] as String,
      type: fields[2] as String,
      tags: fields[3] as String,
      previewURL: fields[4] as String,
      previewWidth: fields[5] as int,
      previewHeight: fields[6] as int,
      webformatURL: fields[7] as String,
      webformatWidth: fields[8] as int,
      webformatHeight: fields[9] as int,
      largeImageURL: fields[10] as String,
      imageWidth: fields[11] as int,
      imageHeight: fields[12] as int,
      imageSize: fields[13] as int,
      views: fields[14] as int,
      downloads: fields[15] as int,
      likes: fields[16] as int,
      comments: fields[17] as int,
      user_id: fields[18] as int,
      user: fields[19] as String,
      userImageURL: fields[20] as String,
      fullHDURL: fields[21] as String?,
      imageURL: fields[22] as String?,
      vectorURL: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PixabayImageModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.pageURL)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.previewURL)
      ..writeByte(5)
      ..write(obj.previewWidth)
      ..writeByte(6)
      ..write(obj.previewHeight)
      ..writeByte(7)
      ..write(obj.webformatURL)
      ..writeByte(8)
      ..write(obj.webformatWidth)
      ..writeByte(9)
      ..write(obj.webformatHeight)
      ..writeByte(10)
      ..write(obj.largeImageURL)
      ..writeByte(11)
      ..write(obj.imageWidth)
      ..writeByte(12)
      ..write(obj.imageHeight)
      ..writeByte(13)
      ..write(obj.imageSize)
      ..writeByte(14)
      ..write(obj.views)
      ..writeByte(15)
      ..write(obj.downloads)
      ..writeByte(16)
      ..write(obj.likes)
      ..writeByte(17)
      ..write(obj.comments)
      ..writeByte(18)
      ..write(obj.user_id)
      ..writeByte(19)
      ..write(obj.user)
      ..writeByte(20)
      ..write(obj.userImageURL)
      ..writeByte(21)
      ..write(obj.fullHDURL)
      ..writeByte(22)
      ..write(obj.imageURL)
      ..writeByte(23)
      ..write(obj.vectorURL);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PixabayImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixabayImageModelImpl _$$PixabayImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PixabayImageModelImpl(
      id: (json['id'] as num).toInt(),
      pageURL: json['pageURL'] as String,
      type: json['type'] as String,
      tags: json['tags'] as String,
      previewURL: json['previewURL'] as String,
      previewWidth: (json['previewWidth'] as num).toInt(),
      previewHeight: (json['previewHeight'] as num).toInt(),
      webformatURL: json['webformatURL'] as String,
      webformatWidth: (json['webformatWidth'] as num).toInt(),
      webformatHeight: (json['webformatHeight'] as num).toInt(),
      largeImageURL: json['largeImageURL'] as String,
      imageWidth: (json['imageWidth'] as num).toInt(),
      imageHeight: (json['imageHeight'] as num).toInt(),
      imageSize: (json['imageSize'] as num).toInt(),
      views: (json['views'] as num).toInt(),
      downloads: (json['downloads'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      comments: (json['comments'] as num).toInt(),
      user_id: (json['user_id'] as num).toInt(),
      user: json['user'] as String,
      userImageURL: json['userImageURL'] as String,
      fullHDURL: json['fullHDURL'] as String?,
      imageURL: json['imageURL'] as String?,
      vectorURL: json['vectorURL'] as String?,
    );

Map<String, dynamic> _$$PixabayImageModelImplToJson(
        _$PixabayImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.user_id,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
      'fullHDURL': instance.fullHDURL,
      'imageURL': instance.imageURL,
      'vectorURL': instance.vectorURL,
    };
