// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get notification_id => throw _privateConstructorUsedError;
  String get feed_id => throw _privateConstructorUsedError;
  String get notiText => throw _privateConstructorUsedError;
  bool get is_read => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  String get notification_owner_id => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
    Notification value,
    $Res Function(Notification) then,
  ) = _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call({
    String notification_id,
    String feed_id,
    String notiText,
    bool is_read,
    DateTime created_at,
    String notification_owner_id,
  });
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification_id = null,
    Object? feed_id = null,
    Object? notiText = null,
    Object? is_read = null,
    Object? created_at = null,
    Object? notification_owner_id = null,
  }) {
    return _then(
      _value.copyWith(
            notification_id:
                null == notification_id
                    ? _value.notification_id
                    : notification_id // ignore: cast_nullable_to_non_nullable
                        as String,
            feed_id:
                null == feed_id
                    ? _value.feed_id
                    : feed_id // ignore: cast_nullable_to_non_nullable
                        as String,
            notiText:
                null == notiText
                    ? _value.notiText
                    : notiText // ignore: cast_nullable_to_non_nullable
                        as String,
            is_read:
                null == is_read
                    ? _value.is_read
                    : is_read // ignore: cast_nullable_to_non_nullable
                        as bool,
            created_at:
                null == created_at
                    ? _value.created_at
                    : created_at // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            notification_owner_id:
                null == notification_owner_id
                    ? _value.notification_owner_id
                    : notification_owner_id // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
    _$NotificationImpl value,
    $Res Function(_$NotificationImpl) then,
  ) = __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String notification_id,
    String feed_id,
    String notiText,
    bool is_read,
    DateTime created_at,
    String notification_owner_id,
  });
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
    _$NotificationImpl _value,
    $Res Function(_$NotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification_id = null,
    Object? feed_id = null,
    Object? notiText = null,
    Object? is_read = null,
    Object? created_at = null,
    Object? notification_owner_id = null,
  }) {
    return _then(
      _$NotificationImpl(
        notification_id:
            null == notification_id
                ? _value.notification_id
                : notification_id // ignore: cast_nullable_to_non_nullable
                    as String,
        feed_id:
            null == feed_id
                ? _value.feed_id
                : feed_id // ignore: cast_nullable_to_non_nullable
                    as String,
        notiText:
            null == notiText
                ? _value.notiText
                : notiText // ignore: cast_nullable_to_non_nullable
                    as String,
        is_read:
            null == is_read
                ? _value.is_read
                : is_read // ignore: cast_nullable_to_non_nullable
                    as bool,
        created_at:
            null == created_at
                ? _value.created_at
                : created_at // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        notification_owner_id:
            null == notification_owner_id
                ? _value.notification_owner_id
                : notification_owner_id // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl extends _Notification {
  const _$NotificationImpl({
    required this.notification_id,
    required this.feed_id,
    required this.notiText,
    required this.is_read,
    required this.created_at,
    required this.notification_owner_id,
  }) : super._();

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String notification_id;
  @override
  final String feed_id;
  @override
  final String notiText;
  @override
  final bool is_read;
  @override
  final DateTime created_at;
  @override
  final String notification_owner_id;

  @override
  String toString() {
    return 'Notification(notification_id: $notification_id, feed_id: $feed_id, notiText: $notiText, is_read: $is_read, created_at: $created_at, notification_owner_id: $notification_owner_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.notification_id, notification_id) ||
                other.notification_id == notification_id) &&
            (identical(other.feed_id, feed_id) || other.feed_id == feed_id) &&
            (identical(other.notiText, notiText) ||
                other.notiText == notiText) &&
            (identical(other.is_read, is_read) || other.is_read == is_read) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.notification_owner_id, notification_owner_id) ||
                other.notification_owner_id == notification_owner_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    notification_id,
    feed_id,
    notiText,
    is_read,
    created_at,
    notification_owner_id,
  );

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(this);
  }
}

abstract class _Notification extends Notification {
  const factory _Notification({
    required final String notification_id,
    required final String feed_id,
    required final String notiText,
    required final bool is_read,
    required final DateTime created_at,
    required final String notification_owner_id,
  }) = _$NotificationImpl;
  const _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get notification_id;
  @override
  String get feed_id;
  @override
  String get notiText;
  @override
  bool get is_read;
  @override
  DateTime get created_at;
  @override
  String get notification_owner_id;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
