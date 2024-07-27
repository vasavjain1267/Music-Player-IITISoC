import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  SearchBar({required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  late stt.SpeechToText _speechToText;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speechToText.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speechToText.listen(onResult: (result) {
        setState(() {
          _searchController.text = result.recognizedWords;
        });
        widget.onSearch(result.recognizedWords);
      });
    }
  }

  void _stopListening() {
    _speechToText.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for songs...',
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(
                  _isListening ? Icons.mic_off : Icons.mic,
                  color: _isListening ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  if (_isListening) {
                    _stopListening();
                  } else {
                    _startListening();
                  }
                },
              ),
            ),
            onChanged: widget.onSearch,
          ),
        ),
      ],
    );
  }
}
