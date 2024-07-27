import 'package:hive_flutter/hive_flutter.dart';
import 'hive_model.dart';
import 'playlist_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SongAdapter());
    Hive.registerAdapter(PlaylistAdapter());
  }
}
