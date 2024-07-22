import 'package:flutter/material.dart';
import 'package:harmonix/mainmusic/models/song_model.dart';
import 'package:hive/hive.dart';
///import 'package:trial5/models/song_model.dart';
import 'player_screen.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<SongModel> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final box = Hive.box<SongModel>('favorites');
    setState(() {
      _favorites = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: ListView.builder(
        itemCount: _favorites.length,
        itemBuilder: (context, index) {
          final song = _favorites[index];
          return ListTile(
            leading: Image.network(
              song.cover,
              width: 70,
              height: 150,
              fit: BoxFit.cover,
            ),
            title: Text(song.title,
                style: TextStyle(color: Color.fromARGB(255, 2, 143, 44))),
            subtitle: Text(song.artist,
                style: TextStyle(color: const Color.fromARGB(255, 182, 3, 3))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
