import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harmonix/ai/pages/home_page.dart';
import 'package:harmonix/mainmusic/models/song_model.dart';
import 'package:harmonix/mainmusic/services/deezer_service.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
//import 'package:trial5/models/song_model.dart';
//import 'package:trial5/services/deezer_service.dart';
import 'player_screen.dart';

class SongListPage extends StatefulWidget {
  @override
  _SongListPageState createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<SongModel> _songs = [];
  List<SongModel> _recentlyPlayed = [];

  @override
  void initState() {
    super.initState();
    _searchController.text = 'mukesh';
    _searchSongs();
    _loadRecentlyPlayed();
  }

  Future<void> _searchSongs() async {
    final songs = await DeezerService.searchSongs(_searchController.text);
    setState(() {
      _songs = songs;
    });
  }

  void _loadRecentlyPlayed() {
    final box = Hive.box<SongModel>('recentlyPlayed');
    setState(() {
      _recentlyPlayed = box.values.toList();
    });
  }

  void _addToRecentlyPlayed(SongModel song) {
    final box = Hive.box<SongModel>('recentlyPlayed');
    if (!box.values.any((s) => s.id == song.id)) {
      box.add(song);
      _loadRecentlyPlayed();
    }
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
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search songs',
            //suffixIcon: GestureDetector(child: Icon(Icons.search_sharp),onTap: (_) => _searchSongs(),),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: _searchSongs,
            ),
          ),
          //onSubmitted: (_) => _searchSongs(),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          children: [
            if (_recentlyPlayed.isNotEmpty)
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _recentlyPlayed.length,
                  itemBuilder: (context, index) {
                    final song = _recentlyPlayed[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerScreen(song: song),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(song.cover, width: 100, height: 100),
                          Text(song.title,
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 184, 12, 12))),
                          Text(song.artist,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 8, 187, 17))),
                        ],
                      ),
                    );
                  },
                ),
              ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 0.7,
                  mainAxisSpacing: 0.1,
                ),
                itemCount: _songs.length,
                itemBuilder: (context, index) {
                  final song = _songs[index];
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
                        Image.network(song.cover, width: 150, height: 150),
                        Text(song.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromARGB(255, 187, 207, 6))),
                        Text(song.artist,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromARGB(255, 14, 207, 23))),
                        IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: const Color.fromARGB(255, 114, 3, 3)),
                          onPressed: () {
                            final box = Hive.box<SongModel>('favorites');
                            if (!box.values.any((s) => s.id == song.id)) {
                              box.add(song);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
