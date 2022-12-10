import 'package:test_task/models/post_model.dart';
import 'package:test_task/resources/api_client.dart';

class PostRepository {
  final ApiClient apiClient = ApiClient();

  Future<List<PostModel>> fetchAllPosts({required int page}) =>
      apiClient.fetchPosts(page);
}
