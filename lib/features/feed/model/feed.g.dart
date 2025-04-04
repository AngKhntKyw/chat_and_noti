// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedImpl _$$FeedImplFromJson(Map<String, dynamic> json) => _$FeedImpl(
  id: json['id'] as String,
  feed_text: json['feed_text'] as String,
  image: json['image'] as String,
  created_at: DateTime.parse(json['created_at'] as String),
  feed_owner_id: json['feed_owner_id'] as String,
);

Map<String, dynamic> _$$FeedImplToJson(_$FeedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feed_text': instance.feed_text,
      'image': instance.image,
      'created_at': instance.created_at.toIso8601String(),
      'feed_owner_id': instance.feed_owner_id,
    };
