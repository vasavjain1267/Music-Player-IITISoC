import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:harmonix/mainmusic/models/song_model.dart';
//import 'package:trial5/models/song_model.dart';
import 'package:palette_generator/palette_generator.dart';

class PlayerScreen extends StatefulWidget {
  final SongModel song;

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

  @override
  void initState() {
    super.initState();
    _setUpPlayer();
    _generateBackgroundColor();
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
      NetworkImage(widget.song.cover),
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
            Image.network(widget.song.cover, width: 250, height: 250),
            SizedBox(height: 20),
            Text(widget.song.title, style: TextStyle(color: Colors.white, fontSize: 24)),
            Text(widget.song.artist, style: TextStyle(color: Colors.white, fontSize: 18)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous, color: Colors.white),
                  iconSize: 50,
                  onPressed: () {
                    // Implement skip previous functionality
                  },
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
                  iconSize: 50,
                  onPressed: _playPause,
                ),
                IconButton(
                  icon: Icon(Icons.skip_next, color: Colors.white),
                  iconSize: 50,
                  onPressed: () {
                    // Implement skip next functionality
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
