import 'package:flutter_blog/domain/user/user.dart';

class Post {
  final int? id;
  final String? title;
  final String? content;

  Post({this.id, this.title, this.content});

  // 통신을 위한 Dart 오브젝트
  Post.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"];
}
