import 'package:youtube_app/models/models.dart';

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    this.id,
    this.author,
    this.title,
    this.thumbnailUrl,
    this.duration,
    this.timestamp,
    this.viewCount,
    this.likes,
    this.dislikes,
  });
}
