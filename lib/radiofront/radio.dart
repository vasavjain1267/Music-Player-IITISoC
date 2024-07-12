class RadioModel {
  final String? image;
  final String? title;
  final String? subtitle;
 
  final String? votes;
  final String? audioUrl;

  RadioModel(this.image, this.title, this.subtitle,  this.votes, this.audioUrl);

  factory RadioModel.fromJson(Map json) => RadioModel(
        json['image'],
        json['title'],
        json['subtitle'],
        json['votes']?.toString(),
        json['audio_url'],
      );
}

// List<RadioModel> radioList = [
//   RadioModel(
//       "https://th.bing.com/th?id=OIP.jVXkrYFQCqs3pB-eZzA4qgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
//       "Radio Show 1",
//       "Podcast Episode 1",
//       "12:00 PM"),
//   RadioModel(
//       "https://th.bing.com/th?id=OIP.jVXkrYFQCqs3pB-eZzA4qgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
//       "Radio Show 2",
//       "Podcast Episode 2",
//       "1:00 PM"),
//   RadioModel(
//       "https://th.bing.com/th?id=OIP.jVXkrYFQCqs3pB-eZzA4qgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
//       "Radio Show 3",
//       "Podcast Episode 3",
//       "2:00 PM"),
//   RadioModel(
//       "https://th.bing.com/th?id=OIP.jVXkrYFQCqs3pB-eZzA4qgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
//       "Radio Show 4",
//       "Podcast Episode 4",
//       "3:00 PM"),
//   RadioModel(
//       "https://th.bing.com/th?id=OIP.jVXkrYFQCqs3pB-eZzA4qgHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
//       "Radio Show 4",
//       "Podcast Episode 4",
//       "3:00 PM"),
// ];
