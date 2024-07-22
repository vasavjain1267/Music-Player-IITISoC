import 'dart:convert';
import 'package:harmonix/mainmusic/models/song_model.dart';
import 'package:http/http.dart' as http;
//import 'package:trial5/models/song_model.dart';

class DeezerService {
  static Future<List<SongModel>> searchSongs(String query) async {
    final response =
        await http.get(Uri.parse('https://deezerdevs-deezer.p.rapidapi.com/search?q=$query'),headers: {
        'x-rapidapi-host': "deezerdevs-deezer.p.rapidapi.com",
        'x-rapidapi-key': "626a4ec423msh92cb7711d2919bep1a757fjsne167d2c5b64b"
      },);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<SongModel>.from(data.map((song) {
        return SongModel(
          id: song['id'].toString(),
          title: song['title'],
          artist: song['artist']['name'],
          cover: song['album']['cover_big'],
          preview: song['preview'],
        );
      }));
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
