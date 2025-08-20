// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      notification_id: json['notification_id'] as String,
      feed_id: json['feed_id'] as String,
      notiText: json['notiText'] as String,
      is_read: json['is_read'] as bool,
      created_at: DateTime.parse(json['created_at'] as String),
      notification_owner_id: json['notification_owner_id'] as String,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'notification_id': instance.notification_id,
      'feed_id': instance.feed_id,
      'notiText': instance.notiText,
      'is_read': instance.is_read,
      'created_at': instance.created_at.toIso8601String(),
      'notification_owner_id': instance.notification_owner_id,
    };
