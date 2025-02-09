import 'dart:convert';

import 'package:instagram_clone/features/posts/domain/entities/post_entity.dart';

import '../../../../models/user.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.user, required super.caption, required super.images});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      caption: json['caption'],
      images: List<String>.from(json['images']),
      user: User.fromJson(json['user']),
    );
  }

  static List<PostModel> fromJsonList(String jsonStr) {
    final List<dynamic> jsonData = json.decode(jsonStr);
    return jsonData.map((e) => PostModel.fromJson(e)).toList();
  }
}
