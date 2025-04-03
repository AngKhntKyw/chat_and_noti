// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      user_id: json['user_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      fcm_token: json['fcm_token'] as String,
      profile_url: json['profile_url'] as String,
      user_serial_number: (json['user_serial_number'] as num).toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'name': instance.name,
      'email': instance.email,
      'fcm_token': instance.fcm_token,
      'profile_url': instance.profile_url,
      'user_serial_number': instance.user_serial_number,
    };
