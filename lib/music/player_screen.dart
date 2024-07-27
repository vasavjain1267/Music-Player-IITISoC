import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// //import 'package:harmonix/mainmusic/models/song_model.dart';
// //import 'package:trial5/models/song_model.dart';
import 'package:palette_generator/palette_generator.dart';
//import 'package:trial7/hive_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_model.dart';
import 'playlist_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class PlayerScreen extends StatefulWidget {
  final Song song;

  PlayerScreen({required this.song});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();
  Color _backgroundColor = Colors.black;
  late Song _currentSong;
  late List<Playlist> _playlists;
  late Box<Playlist> _playlistBox;
  Playlist? _selectedPlaylist;

  @override
  void initState() {
    super.initState();
    _setUpPlayer();
    _generateBackgroundColor();
    _currentSong = widget.song;
    _loadPlaylists();
  }

  void _setUpPlayer() {
    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    _audioPlayer.setSourceUrl(widget.song.preview);
  }

  void _generateBackgroundColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.song.albumCover),
    );
    setState(() {
      _backgroundColor = paletteGenerator.dominantColor?.color ?? Colors.black;
    });
  }

  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(widget.song.preview));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  Future<void> _loadPlaylists() async {
    _playlistBox = await Hive.openBox<Playlist>('playlists');
    setState(() {
      _playlists = _playlistBox.values.toList();
    });
  }

  void _addToPlaylist() {
    if (_selectedPlaylist != null) {
      _selectedPlaylist!.songs.add(_currentSong);
      _selectedPlaylist!.save();
    }
  }

  void _showPlaylistDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add to Playlist"),
          content: DropdownButton<Playlist>(
            hint: Text("Select Playlist"),
            value: _selectedPlaylist,
            onChanged: (Playlist? newValue) {
              setState(() {
                _selectedPlaylist = newValue;
              });
            },
            items: _playlists.map((playlist) {
              return DropdownMenuItem<Playlist>(
                value: playlist,
                child: Text(playlist.name),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add"),
              onPressed: () {
                _addToPlaylist();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _downloadSong() async {
    try {
      // Get the directory to save the downloaded file
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${_currentSong.title}.mp3';

      // Create a Dio instance to handle the download
      final dio = Dio();
      await dio.download(_currentSong.preview, filePath);

      // Notify the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to $filePath')),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download song')),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_backgroundColor.withOpacity(0.8), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(widget.song.albumCover, width: 250, height: 250),
            SizedBox(height: 20),
            Text(widget.song.title,
                style: TextStyle(color: Colors.white, fontSize: 24)),
            Text(widget.song.artist,
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (value) {
                _seekTo(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split('.').first,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  (_duration - _position).toString().split('.').first,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // IconButton(
                //   icon: Icon(Icons.skip_previous, color: Colors.white),
                //   iconSize: 50,
                //   onPressed: () {
                //     // Implement skip previous functionality
                //   },
                // ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white),
                  iconSize: 50,
                  onPressed: _playPause,
                ),
                // IconButton(
                //   icon: Icon(Icons.skip_next, color: Colors.white),
                //   iconSize: 50,
                //   onPressed: () {
                //     // Implement skip next funIcons.ctionality
                //   },
                // ),
                ElevatedButton(
                  onPressed: _downloadSong,
                  child: Icon(Icons.download),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _showPlaylistDialog,
              child: Text("Add to Playlist"),
            ),
          ],
        ),
      ),
    );
  }
}

// class PlayerScreen extends StatefulWidget {
//   final Song song;

//   PlayerScreen({required this.song});

//   @override
//   _PlayerScreenState createState() => _PlayerScreenState();
// }

// class _PlayerScreenState extends State<PlayerScreen> {
//   late Song _currentSong;
//   late List<Playlist> _playlists;
//   late Box<Playlist> _playlistBox;
//   Playlist? _selectedPlaylist;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   Duration _duration = Duration();
//   Duration _position = Duration();
//   Color _backgroundColor = Colors.black;


//   @override
//   void initState() {
//     super.initState();
    
//     _currentSong = widget.song;
//     _loadPlaylists();
    
//   }
  
// //   void initState() {
// //     super.initState();
// //     _setUpPlayer();
// //     _generateBackgroundColor();
// //   }

//   Future<void> _loadPlaylists() async {
//     _playlistBox = await Hive.openBox<Playlist>('playlists');
//     setState(() {
//       _playlists = _playlistBox.values.toList();
//     });
//   }

  // void _addToPlaylist() {
  //   if (_selectedPlaylist != null) {
  //     _selectedPlaylist!.songs.add(_currentSong);
  //     _selectedPlaylist!.save();
  //   }
  // }

//   void _showPlaylistDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Add to Playlist"),
//           content: DropdownButton<Playlist>(
//             hint: Text("Select Playlist"),
//             value: _selectedPlaylist,
//             onChanged: (Playlist? newValue) {
//               setState(() {
//                 _selectedPlaylist = newValue;
//               });
//             },
//             items: _playlists.map((playlist) {
//               return DropdownMenuItem<Playlist>(
//                 value: playlist,
//                 child: Text(playlist.name),
//               );
//             }).toList(),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text("Add"),
//               onPressed: () {
//                 _addToPlaylist();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(_currentSong.title)),
//       body: Column(
//         children: [
//           // Display current song details and player controls here
//           // ...

//           // Add to Playlist Button
          
//           ElevatedButton(
//             onPressed: _showPlaylistDialog,
//             child: Text("Add to Playlist"),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'hive_model.dart';
// import 'playlist_model.dart';

// class PlayerScreen extends StatefulWidget {
//   final Song song;

//   PlayerScreen({required this.song});

//   @override
//   _PlayerScreenState createState() => _PlayerScreenState();
// }

// class _PlayerScreenState extends State<PlayerScreen> {
//   late Song _currentSong;
//   late AudioPlayer _audioPlayer;
//   late Box<Playlist> _playlistBox;
//   List<Playlist> _playlists = [];
//   Playlist? _selectedPlaylist;
//   Duration _currentPosition = Duration.zero;
//   Duration _duration = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _currentSong = widget.song;
//     _audioPlayer = AudioPlayer();
//     _initPlayer();
//     _loadPlaylists();
//   }

//   Future<void> _initPlayer() async {
//     await _audioPlayer.setUrl(_currentSong.previewUrl);
//     _audioPlayer.onDurationChanged.listen((duration) {
//       setState(() {
//         _duration = duration;
//       });
//     });
//     _audioPlayer.onAudioPositionChanged.listen((position) {
//       setState(() {
//         _currentPosition = position;
//       });
//     });
//     _audioPlayer.play(_currentSong.previewUrl);
//   }

//   Future<void> _loadPlaylists() async {
//     _playlistBox = await Hive.openBox<Playlist>('playlists');
//     setState(() {
//       _playlists = _playlistBox.values.toList();
//     });
//   }

//   void _addToPlaylist() {
//     if (_selectedPlaylist != null) {
//       _selectedPlaylist!.songs.add(_currentSong);
//       _selectedPlaylist!.save();
//     }
//   }

//   void _showPlaylistDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Add to Playlist"),
//           content: DropdownButton<Playlist>(
//             hint: Text("Select Playlist"),
//             value: _selectedPlaylist,
//             onChanged: (Playlist? newValue) {
//               setState(() {
//                 _selectedPlaylist = newValue;
//               });
//             },
//             items: _playlists.map((playlist) {
//               return DropdownMenuItem<Playlist>(
//                 value: playlist,
//                 child: Text(playlist.name),
//               );
//             }).toList(),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text("Add"),
//               onPressed: () {
//                 _addToPlaylist();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(_currentSong.title)),
//       body: Column(
//         children: [
//           // Display current song details and player controls
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.purple, Colors.black],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(_currentSong.title, style: TextStyle(fontSize: 24, color: Colors.white)),
//                   Text(_currentSong.artist, style: TextStyle(fontSize: 18, color: Colors.white70)),
//                   SizedBox(height: 20),
//                   _buildPlayerControls(),
//                   SizedBox(height: 20),
//                   _buildSlider(),
//                 ],
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _showPlaylistDialog,
//             child: Text("Add to Playlist"),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPlayerControls() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           icon: Icon(Icons.skip_previous, color: Colors.white),
//           onPressed: () {
//             // Handle skip previous
//           },
//         ),
//         IconButton(
//           icon: Icon(_audioPlayer.state == PlayerState.PLAYING ? Icons.pause : Icons.play_arrow, color: Colors.white),
//           onPressed: () {
//             if (_audioPlayer.state == PlayerState.PLAYING) {
//               _audioPlayer.pause();
//             } else {
//               _audioPlayer.play(_currentSong.previewUrl);
//             }
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.skip_next, color: Colors.white),
//           onPressed: () {
//             // Handle skip next
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildSlider() {
//     return Slider(
//       value: _currentPosition.inSeconds.toDouble(),
//       min: 0,
//       max: _duration.inSeconds.toDouble(),
//       onChanged: (value) {
//         setState(() {
//           _audioPlayer.seek(Duration(seconds: value.toInt()));
//         });
//       },
//       onChangeEnd: (value) {
//         _audioPlayer.seek(Duration(seconds: value.toInt()));
//       },
//     );
//   }
// }
