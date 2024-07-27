import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Song extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String artist;

  @HiveField(3)
  late String albumCover;

  @HiveField(4)
  late String preview;
}
