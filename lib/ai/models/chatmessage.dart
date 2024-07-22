// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chatmessage {
  final String role;
  final List<Chatpartmodel> parts;

  Chatmessage({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'role': role,
      'parts': parts.map((x) {return x.toMap();}).toList(growable: false),
    };
  }

  factory Chatmessage.fromMap(Map<String, dynamic> map) {
    return Chatmessage(
      role: (map["role"] ?? '') as String,
      parts: List<Chatpartmodel>.from(((map['parts'] ?? const <Chatpartmodel>[]) as List).map<Chatpartmodel>((x) {return Chatpartmodel.fromMap((x?? Map<String,dynamic>.from({})) as Map<String,dynamic>);}),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chatmessage.fromJson(String source) => Chatmessage.fromMap(json.decode(source) as Map<String, dynamic>);
  }


class Chatpartmodel {
  final String text;

  Chatpartmodel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory Chatpartmodel.fromMap(Map<String, dynamic> map) {
    return Chatpartmodel(
      text: (map["text"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chatpartmodel.fromJson(String source) => Chatpartmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
