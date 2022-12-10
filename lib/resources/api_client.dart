import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/models/post_model.dart';

const String server = 'jsonplaceholder.typicode.com';

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
}
