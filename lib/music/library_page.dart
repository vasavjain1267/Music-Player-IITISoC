import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_model.dart';
import 'playlist_model.dart';
import 'player_screen.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<Song> _favoriteSongs = [];
  List<Playlist> _playlists = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteSongs();
    _loadPlaylists();
  }

  Future<void> _loadFavoriteSongs() async {
    final box = await Hive.openBox<Song>('favorites');
    setState(() {
      _favoriteSongs = box.values.toList();
    });
  }

  Future<void> _loadPlaylists() async {
    final box = await Hive.openBox<Playlist>('playlists');
    setState(() {
      _playlists = box.values.toList();
    });
  }

  void _playSong(Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerScreen(song: song)),
    );
  }

  void _showCreatePlaylistDialog() {
    final TextEditingController _playlistNameController =
        TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create Playlist"),
          content: TextField(
            controller: _playlistNameController,
            decoration: InputDecoration(hintText: "Playlist Name"),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Create"),
              onPressed: () {
                _createPlaylist(_playlistNameController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _createPlaylist(String name) async {
    final box = await Hive.openBox<Playlist>('playlists');
    final newPlaylist = Playlist()
      ..name = name
      ..songs = [];
    await box.add(newPlaylist);
    _loadPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Library")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            if (_favoriteSongs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Favorite Songs",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            if (_favoriteSongs.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _favoriteSongs.length,
                  itemBuilder: (context, index) {
                    final song = _favoriteSongs[index];
                    return ListTile(
                      leading:
                          Image.network(song.albumCover, width: 50, height: 50),
                      title: Text(song.title,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(song.artist,
                          style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        _playSong(song);
                      },
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Playlists",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _playlists.length,
                itemBuilder: (context, index) {
                  final playlist = _playlists[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      leading: playlist.songs.isNotEmpty
                          ? CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                playlist.songs.last.albumCover,
                              ),
                            )
                          : CircleAvatar(
                              child: Icon(Icons.music_note),
                            ),
                      title: Text(playlist.name,
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlaylistDetailPage(playlist: playlist),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePlaylistDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

class PlaylistDetailPage extends StatelessWidget {
  final Playlist playlist;

  PlaylistDetailPage({required this.playlist});

  void _playSong(BuildContext context, Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlayerScreen(song: song)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(playlist.name)),
      body: ListView.builder(
        itemCount: playlist.songs.length,
        itemBuilder: (context, index) {
          final song = playlist.songs[index];
          return ListTile(
            leading: Image.network(song.albumCover, width: 50, height: 50),
            title: Text(song.title),
            subtitle: Text(song.artist),
            onTap: () {
              _playSong(context, song);
            },
          );
        },
      ),
    );
  }
}
