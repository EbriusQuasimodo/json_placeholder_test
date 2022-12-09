import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/models/post_model.dart';

const String server = 'https://jsonplaceholder.typicode.com';

class ApiClient{
  Future<PostList> fetchPosts()async{
    final url = Uri.parse('$server/posts');

    final response = await http.get(url);

    if (response.statusCode == 200){
      return PostList.fromJson(json.decode(response.body));
    }else{
      throw Exception("error");
    }

  }
}