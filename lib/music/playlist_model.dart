import 'package:hive/hive.dart';
import 'hive_model.dart';

part 'playlist_model.g.dart';

@HiveType(typeId: 1)
class Playlist extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late List<Song> songs;
}
