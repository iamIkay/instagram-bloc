import 'package:flutter/services.dart';
import 'package:instagram_clone/features/posts/data/models/post_model.dart';

abstract class PostsLocal {
  Future<List<PostModel>> getPosts(int page);
}

class PostLocalImpl implements PostsLocal {
  @override
  Future<List<PostModel>> getPosts(int page) async {
    const limit = 5;
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API delay

      String jsonString = await rootBundle.loadString('assets/data/posts.json');
      List<PostModel> posts = PostModel.fromJsonList(jsonString);

      final startIndex = (page - 1) * limit;
      if (startIndex >= posts.length) return [];

      return posts.skip(startIndex).take(limit).toList();
    } catch (err) {
      throw Exception(err);
    }
  }
}
