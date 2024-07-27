import 'package:flutter/material.dart';
import 'package:harmonix/ai/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'deezer_service.dart';
import 'hive_model.dart';
import 'player_screen.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SongListPage extends StatefulWidget {
  final String username;
  SongListPage({required this.username});

  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final TextEditingController _searchController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _searchQuery = '';
  List<dynamic> _songs = [];
  List<Song> _filteredSongs = [];
  List<Song> _recentlyPlayed = [];
  List<String> singers = [
    "Arijit",
    "Lata",
    "Mukesh",
    "Shreya",
    "Eminem",
    "Asha",
    "Justin"
  ];
  List<String> singerImages = [
    "arijit.jpeg",
    "lata.jpeg",
    "mukesh.jpeg",
    "shreya.jpeg",
    "eminem.jpeg",
    "asha.jpeg",
    "justin.jpeg"
  ];
  void _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() {
        _isListening = true;
      });
      _speech.listen(
        onResult: (result) {
          setState(() {
            _searchQuery = result.recognizedWords;
            _searchController.text = _searchQuery;
          });
        },
        listenFor: Duration(seconds: 30),
        pauseFor: Duration(seconds: 5),
        partialResults: true,
        onSoundLevelChange: (level) => print("Sound level: $level"),
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
      );
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _loadRecentlyPlayed();
    _searchSongs("Mukesh"); // Default search query
  }

  Future<void> _loadRecentlyPlayed() async {
    final box = await Hive.openBox<Song>('recentlyPlayed');
    setState(() {
      _recentlyPlayed = box.values.toList().reversed.toList();
    });
  }

  Future<void> _searchSongs(String query) async {
    final songs = await DeezerService().searchSongs(query);
    setState(() {
      _songs = songs;
    });
  }

  Future<void> _addToRecentlyPlayed(Song song) async {
    final box = Hive.box<Song>('recentlyPlayed');
    if (!box.values.any((s) => s.id == song.id)) {
      box.add(song);
      _loadRecentlyPlayed();
    }
  }

  void _playSong(Song song) async {
    final box = await Hive.openBox<Song>('recentlyPlayed');
    await box.add(song);
    _loadRecentlyPlayed();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerScreen(song: song)),
    );
  }

  Widget _buildSingerRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(singers.length, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  _searchSongs(singers[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, bottom: 4, top: 4),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${singerImages[index]}'),
                    radius: 52,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(singers[index], style: TextStyle(color: Colors.white)),
            ],
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Container(
            height: 150, width: 150, child: Lottie.asset("assets/ai.json")),
        backgroundColor: Colors.black,
        foregroundColor: Color.fromARGB(255, 122, 122, 2),
      ),
      appBar: AppBar(
        title: Text('Hello ${widget.username}',
            style: const TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 60, 185, 125))),
      ),
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Songs',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isListening ? Icons.mic_off : Icons.mic,
                      ),
                      onPressed: () {
                        if (_isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                    ),
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _searchQuery = text;
                    });
                    // Perform search operation with _searchQuery
                  },
                  style: TextStyle(color: Colors.white),
                  onSubmitted: (query) {
                    _searchSongs(query);
                  },
                ),
              ),
              if (_recentlyPlayed.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Recently Played",
                      style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18)),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: _recentlyPlayed.map((song) {
                //       return GestureDetector(
                //         onTap: () {
                //           _playSong(song);
                //         },
                //         child: Column(
                //           children: [
                //             Image.network(song.albumCover, height: 80, width: 80),
                //             Text(song.title,
                //                 style: TextStyle(color: Colors.white)),
                //           ],
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                Container(
                  height: 112,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _recentlyPlayed.length,
                    itemBuilder: (context, index) {
                      final song = _recentlyPlayed[index];
                      return GestureDetector(
                        onTap: () {
                          _addToRecentlyPlayed(song);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlayerScreen(song: song),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.network(song.albumCover,
                                width: 70, height: 70),
                            Text(song.title,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 184, 12, 12))),
                            Text(song.artist,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 8, 187, 17))),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 7),
                child: Text("Singers",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              _buildSingerRow(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: _songs.length,
                  itemBuilder: (context, index) {
                    final song = _songs[index];
                    return GestureDetector(
                      onTap: () {
                        _playSong(Song()
                          ..id = song['id'].toString()
                          ..title = song['title']
                          ..artist = song['artist']['name']
                          ..albumCover = song['album']['cover_medium']
                          ..preview = song['preview']);
                      },
                      child: Card(
                        color: Colors.black54,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(song['album']['cover_medium'],
                                fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                song['title'],
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                song['artist']['name'],
                                style: TextStyle(color: Colors.white54),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
