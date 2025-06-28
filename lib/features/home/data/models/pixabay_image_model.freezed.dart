// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixabayImageModel _$PixabayImageModelFromJson(Map<String, dynamic> json) {
  return _PixabayImageModel.fromJson(json);
}

/// @nodoc
mixin _$PixabayImageModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get pageURL => throw _privateConstructorUsedError;
  @HiveField(2)
  String get type => throw _privateConstructorUsedError;
  @HiveField(3)
  String get tags => throw _privateConstructorUsedError;
  @HiveField(4)
  String get previewURL => throw _privateConstructorUsedError;
  @HiveField(5)
  int get previewWidth => throw _privateConstructorUsedError;
  @HiveField(6)
  int get previewHeight => throw _privateConstructorUsedError;
  @HiveField(7)
  String get webformatURL => throw _privateConstructorUsedError;
  @HiveField(8)
  int get webformatWidth => throw _privateConstructorUsedError;
  @HiveField(9)
  int get webformatHeight => throw _privateConstructorUsedError;
  @HiveField(10)
  String get largeImageURL => throw _privateConstructorUsedError;
  @HiveField(11)
  int get imageWidth => throw _privateConstructorUsedError;
  @HiveField(12)
  int get imageHeight => throw _privateConstructorUsedError;
  @HiveField(13)
  int get imageSize => throw _privateConstructorUsedError;
  @HiveField(14)
  int get views => throw _privateConstructorUsedError;
  @HiveField(15)
  int get downloads => throw _privateConstructorUsedError;
  @HiveField(16)
  int get likes => throw _privateConstructorUsedError;
  @HiveField(17)
  int get comments => throw _privateConstructorUsedError;
  @HiveField(18)
  int get user_id => throw _privateConstructorUsedError;
  @HiveField(19)
  String get user => throw _privateConstructorUsedError;
  @HiveField(20)
  String get userImageURL => throw _privateConstructorUsedError;
  @HiveField(21)
  String? get fullHDURL => throw _privateConstructorUsedError;
  @HiveField(22)
  String? get imageURL => throw _privateConstructorUsedError;
  @HiveField(23)
  String? get vectorURL => throw _privateConstructorUsedError;

  /// Serializes this PixabayImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixabayImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixabayImageModelCopyWith<PixabayImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayImageModelCopyWith<$Res> {
  factory $PixabayImageModelCopyWith(
          PixabayImageModel value, $Res Function(PixabayImageModel) then) =
      _$PixabayImageModelCopyWithImpl<$Res, PixabayImageModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pageURL,
      @HiveField(2) String type,
      @HiveField(3) String tags,
      @HiveField(4) String previewURL,
      @HiveField(5) int previewWidth,
      @HiveField(6) int previewHeight,
      @HiveField(7) String webformatURL,
      @HiveField(8) int webformatWidth,
      @HiveField(9) int webformatHeight,
      @HiveField(10) String largeImageURL,
      @HiveField(11) int imageWidth,
      @HiveField(12) int imageHeight,
      @HiveField(13) int imageSize,
      @HiveField(14) int views,
      @HiveField(15) int downloads,
      @HiveField(16) int likes,
      @HiveField(17) int comments,
      @HiveField(18) int user_id,
      @HiveField(19) String user,
      @HiveField(20) String userImageURL,
      @HiveField(21) String? fullHDURL,
      @HiveField(22) String? imageURL,
      @HiveField(23) String? vectorURL});
}

/// @nodoc
class _$PixabayImageModelCopyWithImpl<$Res, $Val extends PixabayImageModel>
    implements $PixabayImageModelCopyWith<$Res> {
  _$PixabayImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixabayImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pageURL = null,
    Object? type = null,
    Object? tags = null,
    Object? previewURL = null,
    Object? previewWidth = null,
    Object? previewHeight = null,
    Object? webformatURL = null,
    Object? webformatWidth = null,
    Object? webformatHeight = null,
    Object? largeImageURL = null,
    Object? imageWidth = null,
    Object? imageHeight = null,
    Object? imageSize = null,
    Object? views = null,
    Object? downloads = null,
    Object? likes = null,
    Object? comments = null,
    Object? user_id = null,
    Object? user = null,
    Object? userImageURL = null,
    Object? fullHDURL = freezed,
    Object? imageURL = freezed,
    Object? vectorURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pageURL: null == pageURL
          ? _value.pageURL
          : pageURL // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      previewURL: null == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String,
      previewWidth: null == previewWidth
          ? _value.previewWidth
          : previewWidth // ignore: cast_nullable_to_non_nullable
              as int,
      previewHeight: null == previewHeight
          ? _value.previewHeight
          : previewHeight // ignore: cast_nullable_to_non_nullable
              as int,
      webformatURL: null == webformatURL
          ? _value.webformatURL
          : webformatURL // ignore: cast_nullable_to_non_nullable
              as String,
      webformatWidth: null == webformatWidth
          ? _value.webformatWidth
          : webformatWidth // ignore: cast_nullable_to_non_nullable
              as int,
      webformatHeight: null == webformatHeight
          ? _value.webformatHeight
          : webformatHeight // ignore: cast_nullable_to_non_nullable
              as int,
      largeImageURL: null == largeImageURL
          ? _value.largeImageURL
          : largeImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageWidth: null == imageWidth
          ? _value.imageWidth
          : imageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageHeight: null == imageHeight
          ? _value.imageHeight
          : imageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      fullHDURL: freezed == fullHDURL
          ? _value.fullHDURL
          : fullHDURL // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      vectorURL: freezed == vectorURL
          ? _value.vectorURL
          : vectorURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixabayImageModelImplCopyWith<$Res>
    implements $PixabayImageModelCopyWith<$Res> {
  factory _$$PixabayImageModelImplCopyWith(_$PixabayImageModelImpl value,
          $Res Function(_$PixabayImageModelImpl) then) =
      __$$PixabayImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pageURL,
      @HiveField(2) String type,
      @HiveField(3) String tags,
      @HiveField(4) String previewURL,
      @HiveField(5) int previewWidth,
      @HiveField(6) int previewHeight,
      @HiveField(7) String webformatURL,
      @HiveField(8) int webformatWidth,
      @HiveField(9) int webformatHeight,
      @HiveField(10) String largeImageURL,
      @HiveField(11) int imageWidth,
      @HiveField(12) int imageHeight,
      @HiveField(13) int imageSize,
      @HiveField(14) int views,
      @HiveField(15) int downloads,
      @HiveField(16) int likes,
      @HiveField(17) int comments,
      @HiveField(18) int user_id,
      @HiveField(19) String user,
      @HiveField(20) String userImageURL,
      @HiveField(21) String? fullHDURL,
      @HiveField(22) String? imageURL,
      @HiveField(23) String? vectorURL});
}

/// @nodoc
class __$$PixabayImageModelImplCopyWithImpl<$Res>
    extends _$PixabayImageModelCopyWithImpl<$Res, _$PixabayImageModelImpl>
    implements _$$PixabayImageModelImplCopyWith<$Res> {
  __$$PixabayImageModelImplCopyWithImpl(_$PixabayImageModelImpl _value,
      $Res Function(_$PixabayImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixabayImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pageURL = null,
    Object? type = null,
    Object? tags = null,
    Object? previewURL = null,
    Object? previewWidth = null,
    Object? previewHeight = null,
    Object? webformatURL = null,
    Object? webformatWidth = null,
    Object? webformatHeight = null,
    Object? largeImageURL = null,
    Object? imageWidth = null,
    Object? imageHeight = null,
    Object? imageSize = null,
    Object? views = null,
    Object? downloads = null,
    Object? likes = null,
    Object? comments = null,
    Object? user_id = null,
    Object? user = null,
    Object? userImageURL = null,
    Object? fullHDURL = freezed,
    Object? imageURL = freezed,
    Object? vectorURL = freezed,
  }) {
    return _then(_$PixabayImageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pageURL: null == pageURL
          ? _value.pageURL
          : pageURL // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String,
      previewURL: null == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String,
      previewWidth: null == previewWidth
          ? _value.previewWidth
          : previewWidth // ignore: cast_nullable_to_non_nullable
              as int,
      previewHeight: null == previewHeight
          ? _value.previewHeight
          : previewHeight // ignore: cast_nullable_to_non_nullable
              as int,
      webformatURL: null == webformatURL
          ? _value.webformatURL
          : webformatURL // ignore: cast_nullable_to_non_nullable
              as String,
      webformatWidth: null == webformatWidth
          ? _value.webformatWidth
          : webformatWidth // ignore: cast_nullable_to_non_nullable
              as int,
      webformatHeight: null == webformatHeight
          ? _value.webformatHeight
          : webformatHeight // ignore: cast_nullable_to_non_nullable
              as int,
      largeImageURL: null == largeImageURL
          ? _value.largeImageURL
          : largeImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      imageWidth: null == imageWidth
          ? _value.imageWidth
          : imageWidth // ignore: cast_nullable_to_non_nullable
              as int,
      imageHeight: null == imageHeight
          ? _value.imageHeight
          : imageHeight // ignore: cast_nullable_to_non_nullable
              as int,
      imageSize: null == imageSize
          ? _value.imageSize
          : imageSize // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      downloads: null == downloads
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      userImageURL: null == userImageURL
          ? _value.userImageURL
          : userImageURL // ignore: cast_nullable_to_non_nullable
              as String,
      fullHDURL: freezed == fullHDURL
          ? _value.fullHDURL
          : fullHDURL // ignore: cast_nullable_to_non_nullable
              as String?,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
      vectorURL: freezed == vectorURL
          ? _value.vectorURL
          : vectorURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixabayImageModelImpl implements _PixabayImageModel {
  const _$PixabayImageModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.pageURL,
      @HiveField(2) required this.type,
      @HiveField(3) required this.tags,
      @HiveField(4) required this.previewURL,
      @HiveField(5) required this.previewWidth,
      @HiveField(6) required this.previewHeight,
      @HiveField(7) required this.webformatURL,
      @HiveField(8) required this.webformatWidth,
      @HiveField(9) required this.webformatHeight,
      @HiveField(10) required this.largeImageURL,
      @HiveField(11) required this.imageWidth,
      @HiveField(12) required this.imageHeight,
      @HiveField(13) required this.imageSize,
      @HiveField(14) required this.views,
      @HiveField(15) required this.downloads,
      @HiveField(16) required this.likes,
      @HiveField(17) required this.comments,
      @HiveField(18) required this.user_id,
      @HiveField(19) required this.user,
      @HiveField(20) required this.userImageURL,
      @HiveField(21) this.fullHDURL,
      @HiveField(22) this.imageURL,
      @HiveField(23) this.vectorURL});

  factory _$PixabayImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixabayImageModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String pageURL;
  @override
  @HiveField(2)
  final String type;
  @override
  @HiveField(3)
  final String tags;
  @override
  @HiveField(4)
  final String previewURL;
  @override
  @HiveField(5)
  final int previewWidth;
  @override
  @HiveField(6)
  final int previewHeight;
  @override
  @HiveField(7)
  final String webformatURL;
  @override
  @HiveField(8)
  final int webformatWidth;
  @override
  @HiveField(9)
  final int webformatHeight;
  @override
  @HiveField(10)
  final String largeImageURL;
  @override
  @HiveField(11)
  final int imageWidth;
  @override
  @HiveField(12)
  final int imageHeight;
  @override
  @HiveField(13)
  final int imageSize;
  @override
  @HiveField(14)
  final int views;
  @override
  @HiveField(15)
  final int downloads;
  @override
  @HiveField(16)
  final int likes;
  @override
  @HiveField(17)
  final int comments;
  @override
  @HiveField(18)
  final int user_id;
  @override
  @HiveField(19)
  final String user;
  @override
  @HiveField(20)
  final String userImageURL;
  @override
  @HiveField(21)
  final String? fullHDURL;
  @override
  @HiveField(22)
  final String? imageURL;
  @override
  @HiveField(23)
  final String? vectorURL;

  @override
  String toString() {
    return 'PixabayImageModel(id: $id, pageURL: $pageURL, type: $type, tags: $tags, previewURL: $previewURL, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatURL: $webformatURL, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, likes: $likes, comments: $comments, user_id: $user_id, user: $user, userImageURL: $userImageURL, fullHDURL: $fullHDURL, imageURL: $imageURL, vectorURL: $vectorURL)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixabayImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pageURL, pageURL) || other.pageURL == pageURL) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.previewURL, previewURL) ||
                other.previewURL == previewURL) &&
            (identical(other.previewWidth, previewWidth) ||
                other.previewWidth == previewWidth) &&
            (identical(other.previewHeight, previewHeight) ||
                other.previewHeight == previewHeight) &&
            (identical(other.webformatURL, webformatURL) ||
                other.webformatURL == webformatURL) &&
            (identical(other.webformatWidth, webformatWidth) ||
                other.webformatWidth == webformatWidth) &&
            (identical(other.webformatHeight, webformatHeight) ||
                other.webformatHeight == webformatHeight) &&
            (identical(other.largeImageURL, largeImageURL) ||
                other.largeImageURL == largeImageURL) &&
            (identical(other.imageWidth, imageWidth) ||
                other.imageWidth == imageWidth) &&
            (identical(other.imageHeight, imageHeight) ||
                other.imageHeight == imageHeight) &&
            (identical(other.imageSize, imageSize) ||
                other.imageSize == imageSize) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.downloads, downloads) ||
                other.downloads == downloads) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userImageURL, userImageURL) ||
                other.userImageURL == userImageURL) &&
            (identical(other.fullHDURL, fullHDURL) ||
                other.fullHDURL == fullHDURL) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.vectorURL, vectorURL) ||
                other.vectorURL == vectorURL));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        pageURL,
        type,
        tags,
        previewURL,
        previewWidth,
        previewHeight,
        webformatURL,
        webformatWidth,
        webformatHeight,
        largeImageURL,
        imageWidth,
        imageHeight,
        imageSize,
        views,
        downloads,
        likes,
        comments,
        user_id,
        user,
        userImageURL,
        fullHDURL,
        imageURL,
        vectorURL
      ]);

  /// Create a copy of PixabayImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixabayImageModelImplCopyWith<_$PixabayImageModelImpl> get copyWith =>
      __$$PixabayImageModelImplCopyWithImpl<_$PixabayImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixabayImageModelImplToJson(
      this,
    );
  }
}

abstract class _PixabayImageModel implements PixabayImageModel {
  const factory _PixabayImageModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String pageURL,
      @HiveField(2) required final String type,
      @HiveField(3) required final String tags,
      @HiveField(4) required final String previewURL,
      @HiveField(5) required final int previewWidth,
      @HiveField(6) required final int previewHeight,
      @HiveField(7) required final String webformatURL,
      @HiveField(8) required final int webformatWidth,
      @HiveField(9) required final int webformatHeight,
      @HiveField(10) required final String largeImageURL,
      @HiveField(11) required final int imageWidth,
      @HiveField(12) required final int imageHeight,
      @HiveField(13) required final int imageSize,
      @HiveField(14) required final int views,
      @HiveField(15) required final int downloads,
      @HiveField(16) required final int likes,
      @HiveField(17) required final int comments,
      @HiveField(18) required final int user_id,
      @HiveField(19) required final String user,
      @HiveField(20) required final String userImageURL,
      @HiveField(21) final String? fullHDURL,
      @HiveField(22) final String? imageURL,
      @HiveField(23) final String? vectorURL}) = _$PixabayImageModelImpl;

  factory _PixabayImageModel.fromJson(Map<String, dynamic> json) =
      _$PixabayImageModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get pageURL;
  @override
  @HiveField(2)
  String get type;
  @override
  @HiveField(3)
  String get tags;
  @override
  @HiveField(4)
  String get previewURL;
  @override
  @HiveField(5)
  int get previewWidth;
  @override
  @HiveField(6)
  int get previewHeight;
  @override
  @HiveField(7)
  String get webformatURL;
  @override
  @HiveField(8)
  int get webformatWidth;
  @override
  @HiveField(9)
  int get webformatHeight;
  @override
  @HiveField(10)
  String get largeImageURL;
  @override
  @HiveField(11)
  int get imageWidth;
  @override
  @HiveField(12)
  int get imageHeight;
  @override
  @HiveField(13)
  int get imageSize;
  @override
  @HiveField(14)
  int get views;
  @override
  @HiveField(15)
  int get downloads;
  @override
  @HiveField(16)
  int get likes;
  @override
  @HiveField(17)
  int get comments;
  @override
  @HiveField(18)
  int get user_id;
  @override
  @HiveField(19)
  String get user;
  @override
  @HiveField(20)
  String get userImageURL;
  @override
  @HiveField(21)
  String? get fullHDURL;
  @override
  @HiveField(22)
  String? get imageURL;
  @override
  @HiveField(23)
  String? get vectorURL;

  /// Create a copy of PixabayImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixabayImageModelImplCopyWith<_$PixabayImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
