import 'dart:convert';

class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostModel.fromJson(String str) => PostModel.fromMap(
        json.decode(str),
      );

  /// recibe un string lista
  static List<PostModel> fromJsonList(String str) => List<PostModel>.from(
        json.decode(str).map((e) => PostModel.fromMap(e)),
      );

  String toJson() => json.encode(toMap());

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
