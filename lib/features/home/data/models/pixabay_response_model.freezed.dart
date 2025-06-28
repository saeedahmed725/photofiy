// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PixabayResponseModel _$PixabayResponseModelFromJson(Map<String, dynamic> json) {
  return _PixabayResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PixabayResponseModel {
  int get total => throw _privateConstructorUsedError;
  int get totalHits => throw _privateConstructorUsedError;
  List<PixabayImageModel> get hits => throw _privateConstructorUsedError;

  /// Serializes this PixabayResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixabayResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixabayResponseModelCopyWith<PixabayResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayResponseModelCopyWith<$Res> {
  factory $PixabayResponseModelCopyWith(PixabayResponseModel value,
          $Res Function(PixabayResponseModel) then) =
      _$PixabayResponseModelCopyWithImpl<$Res, PixabayResponseModel>;
  @useResult
  $Res call({int total, int totalHits, List<PixabayImageModel> hits});
}

/// @nodoc
class _$PixabayResponseModelCopyWithImpl<$Res,
        $Val extends PixabayResponseModel>
    implements $PixabayResponseModelCopyWith<$Res> {
  _$PixabayResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixabayResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayImageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PixabayResponseModelImplCopyWith<$Res>
    implements $PixabayResponseModelCopyWith<$Res> {
  factory _$$PixabayResponseModelImplCopyWith(_$PixabayResponseModelImpl value,
          $Res Function(_$PixabayResponseModelImpl) then) =
      __$$PixabayResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int totalHits, List<PixabayImageModel> hits});
}

/// @nodoc
class __$$PixabayResponseModelImplCopyWithImpl<$Res>
    extends _$PixabayResponseModelCopyWithImpl<$Res, _$PixabayResponseModelImpl>
    implements _$$PixabayResponseModelImplCopyWith<$Res> {
  __$$PixabayResponseModelImplCopyWithImpl(_$PixabayResponseModelImpl _value,
      $Res Function(_$PixabayResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PixabayResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_$PixabayResponseModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PixabayResponseModelImpl implements _PixabayResponseModel {
  const _$PixabayResponseModelImpl(
      {required this.total,
      required this.totalHits,
      required final List<PixabayImageModel> hits})
      : _hits = hits;

  factory _$PixabayResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixabayResponseModelImplFromJson(json);

  @override
  final int total;
  @override
  final int totalHits;
  final List<PixabayImageModel> _hits;
  @override
  List<PixabayImageModel> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'PixabayResponseModel(total: $total, totalHits: $totalHits, hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixabayResponseModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalHits, totalHits) ||
                other.totalHits == totalHits) &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, totalHits,
      const DeepCollectionEquality().hash(_hits));

  /// Create a copy of PixabayResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixabayResponseModelImplCopyWith<_$PixabayResponseModelImpl>
      get copyWith =>
          __$$PixabayResponseModelImplCopyWithImpl<_$PixabayResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixabayResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PixabayResponseModel implements PixabayResponseModel {
  const factory _PixabayResponseModel(
          {required final int total,
          required final int totalHits,
          required final List<PixabayImageModel> hits}) =
      _$PixabayResponseModelImpl;

  factory _PixabayResponseModel.fromJson(Map<String, dynamic> json) =
      _$PixabayResponseModelImpl.fromJson;

  @override
  int get total;
  @override
  int get totalHits;
  @override
  List<PixabayImageModel> get hits;

  /// Create a copy of PixabayResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixabayResponseModelImplCopyWith<_$PixabayResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
