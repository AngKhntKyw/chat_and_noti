// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get user_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get fcm_token => throw _privateConstructorUsedError;
  String get profile_url => throw _privateConstructorUsedError;
  int get user_serial_number => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String user_id,
    String name,
    String email,
    String fcm_token,
    String profile_url,
    int user_serial_number,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? name = null,
    Object? email = null,
    Object? fcm_token = null,
    Object? profile_url = null,
    Object? user_serial_number = null,
  }) {
    return _then(
      _value.copyWith(
            user_id:
                null == user_id
                    ? _value.user_id
                    : user_id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            fcm_token:
                null == fcm_token
                    ? _value.fcm_token
                    : fcm_token // ignore: cast_nullable_to_non_nullable
                        as String,
            profile_url:
                null == profile_url
                    ? _value.profile_url
                    : profile_url // ignore: cast_nullable_to_non_nullable
                        as String,
            user_serial_number:
                null == user_serial_number
                    ? _value.user_serial_number
                    : user_serial_number // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String user_id,
    String name,
    String email,
    String fcm_token,
    String profile_url,
    int user_serial_number,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? name = null,
    Object? email = null,
    Object? fcm_token = null,
    Object? profile_url = null,
    Object? user_serial_number = null,
  }) {
    return _then(
      _$UserModelImpl(
        user_id:
            null == user_id
                ? _value.user_id
                : user_id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        fcm_token:
            null == fcm_token
                ? _value.fcm_token
                : fcm_token // ignore: cast_nullable_to_non_nullable
                    as String,
        profile_url:
            null == profile_url
                ? _value.profile_url
                : profile_url // ignore: cast_nullable_to_non_nullable
                    as String,
        user_serial_number:
            null == user_serial_number
                ? _value.user_serial_number
                : user_serial_number // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl({
    required this.user_id,
    required this.name,
    required this.email,
    required this.fcm_token,
    required this.profile_url,
    required this.user_serial_number,
  }) : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String user_id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String fcm_token;
  @override
  final String profile_url;
  @override
  final int user_serial_number;

  @override
  String toString() {
    return 'UserModel(user_id: $user_id, name: $name, email: $email, fcm_token: $fcm_token, profile_url: $profile_url, user_serial_number: $user_serial_number)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fcm_token, fcm_token) ||
                other.fcm_token == fcm_token) &&
            (identical(other.profile_url, profile_url) ||
                other.profile_url == profile_url) &&
            (identical(other.user_serial_number, user_serial_number) ||
                other.user_serial_number == user_serial_number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user_id,
    name,
    email,
    fcm_token,
    profile_url,
    user_serial_number,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel({
    required final String user_id,
    required final String name,
    required final String email,
    required final String fcm_token,
    required final String profile_url,
    required final int user_serial_number,
  }) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get user_id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get fcm_token;
  @override
  String get profile_url;
  @override
  int get user_serial_number;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
