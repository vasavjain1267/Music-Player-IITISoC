import 'dart:convert';
import 'package:http/http.dart' as http;

class DeezerService {
  Future<List<dynamic>> searchSongs(String query) async {
    final response = await http.get(Uri.parse('https://deezerdevs-deezer.p.rapidapi.com/search?q=$query'),headers: {
        'x-rapidapi-host': "deezerdevs-deezer.p.rapidapi.com",
        'x-rapidapi-key': "626a4ec423msh92cb7711d2919bep1a757fjsne167d2c5b64b"
      },);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['data'];
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
