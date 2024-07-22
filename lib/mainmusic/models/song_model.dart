import 'package:hive/hive.dart';

part 'song_model.g.dart';

@HiveType(typeId: 0)
class SongModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String artist;

  @HiveField(3)
  String cover;

  @HiveField(4)
  String preview;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.cover,
    required this.preview,
  });
}
