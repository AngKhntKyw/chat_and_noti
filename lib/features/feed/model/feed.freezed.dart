// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
mixin _$Feed {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get feed_text => throw _privateConstructorUsedError;
  set feed_text(String value) => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  set image(String value) => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  set created_at(DateTime value) => throw _privateConstructorUsedError;
  String get feed_owner_id => throw _privateConstructorUsedError;
  set feed_owner_id(String value) => throw _privateConstructorUsedError;

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call({
    String id,
    String feed_text,
    String image,
    DateTime created_at,
    String feed_owner_id,
  });
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? feed_text = null,
    Object? image = null,
    Object? created_at = null,
    Object? feed_owner_id = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            feed_text:
                null == feed_text
                    ? _value.feed_text
                    : feed_text // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
                        as String,
            created_at:
                null == created_at
                    ? _value.created_at
                    : created_at // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            feed_owner_id:
                null == feed_owner_id
                    ? _value.feed_owner_id
                    : feed_owner_id // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
    _$FeedImpl value,
    $Res Function(_$FeedImpl) then,
  ) = __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String feed_text,
    String image,
    DateTime created_at,
    String feed_owner_id,
  });
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
    : super(_value, _then);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? feed_text = null,
    Object? image = null,
    Object? created_at = null,
    Object? feed_owner_id = null,
  }) {
    return _then(
      _$FeedImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        feed_text:
            null == feed_text
                ? _value.feed_text
                : feed_text // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                    as String,
        created_at:
            null == created_at
                ? _value.created_at
                : created_at // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        feed_owner_id:
            null == feed_owner_id
                ? _value.feed_owner_id
                : feed_owner_id // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedImpl extends _Feed {
  _$FeedImpl({
    required this.id,
    required this.feed_text,
    required this.image,
    required this.created_at,
    required this.feed_owner_id,
  }) : super._();

  factory _$FeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedImplFromJson(json);

  @override
  String id;
  @override
  String feed_text;
  @override
  String image;
  @override
  DateTime created_at;
  @override
  String feed_owner_id;

  @override
  String toString() {
    return 'Feed(id: $id, feed_text: $feed_text, image: $image, created_at: $created_at, feed_owner_id: $feed_owner_id)';
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedImplToJson(this);
  }
}

abstract class _Feed extends Feed {
  factory _Feed({
    required String id,
    required String feed_text,
    required String image,
    required DateTime created_at,
    required String feed_owner_id,
  }) = _$FeedImpl;
  _Feed._() : super._();

  factory _Feed.fromJson(Map<String, dynamic> json) = _$FeedImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get feed_text;
  set feed_text(String value);
  @override
  String get image;
  set image(String value);
  @override
  DateTime get created_at;
  set created_at(DateTime value);
  @override
  String get feed_owner_id;
  set feed_owner_id(String value);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
