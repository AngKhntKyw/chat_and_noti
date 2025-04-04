import 'package:freezed_annotation/freezed_annotation.dart';
part 'feed.freezed.dart';
part 'feed.g.dart';

@unfreezed
class Feed with _$Feed {
  const Feed._();

  factory Feed({
    required String id,
    required String feed_text,
    required String image,
    required DateTime created_at,
    required String feed_owner_id,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
