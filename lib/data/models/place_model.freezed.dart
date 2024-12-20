// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  String? get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
  GeoPoint get location => throw _privateConstructorUsedError;
  CategoryEnum get category => throw _privateConstructorUsedError;
  List<CommentModel> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call(
      {String? uuid,
      String title,
      String description,
      String imageUrl,
      @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
      GeoPoint location,
      CategoryEnum category,
      List<CommentModel> comments});
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? category = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
          _$PlaceModelImpl value, $Res Function(_$PlaceModelImpl) then) =
      __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String title,
      String description,
      String imageUrl,
      @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
      GeoPoint location,
      CategoryEnum category,
      List<CommentModel> comments});
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
      _$PlaceModelImpl _value, $Res Function(_$PlaceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? location = null,
    Object? category = null,
    Object? comments = null,
  }) {
    return _then(_$PlaceModelImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryEnum,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  _$PlaceModelImpl(
      {this.uuid,
      required this.title,
      required this.description,
      required this.imageUrl,
      @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
      required this.location,
      required this.category,
      required final List<CommentModel> comments})
      : _comments = comments;

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  @override
  final String? uuid;
  @override
  final String title;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
  final GeoPoint location;
  @override
  final CategoryEnum category;
  final List<CommentModel> _comments;
  @override
  List<CommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'PlaceModel(uuid: $uuid, title: $title, description: $description, imageUrl: $imageUrl, location: $location, category: $category, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      description,
      imageUrl,
      location,
      category,
      const DeepCollectionEquality().hash(_comments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  factory _PlaceModel(
      {final String? uuid,
      required final String title,
      required final String description,
      required final String imageUrl,
      @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
      required final GeoPoint location,
      required final CategoryEnum category,
      required final List<CommentModel> comments}) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  @override
  String? get uuid;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  @JsonKey(fromJson: _locationFromJson, toJson: _locationToJson)
  GeoPoint get location;
  @override
  CategoryEnum get category;
  @override
  List<CommentModel> get comments;
  @override
  @JsonKey(ignore: true)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
