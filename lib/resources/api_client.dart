import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/models/comments_model.dart';
import 'package:test_task/models/post_model.dart';

class ApiClient {
  Future<List<PostModel>> fetchPosts(int page) async {
    final response = await http.get(Uri.https(
      'jsonplaceholder.typicode.com',
      '/posts',
      {'_page': '$page'},
    ));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      return json.map<PostModel>((post) => PostModel.fromJson(post)).toList();
    } else {
      throw Exception("error");
    }
  }

  Future<List<CommentsModel>> fetchComments(int postId) async {
    final response = await http.get(
        Uri.https('jsonplaceholder.typicode.com', '/posts/$postId/comments'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      return json
          .map<CommentsModel>((post) => CommentsModel.fromJson(post))
          .toList();
    } else {
      throw Exception("error");
    }
  }
}
