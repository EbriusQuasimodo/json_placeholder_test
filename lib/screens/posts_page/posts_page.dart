import 'package:flutter/material.dart';
import 'package:test_task/screens/posts_page/components/posts_app_bar.dart';
import 'package:test_task/screens/posts_page/components/posts_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostsAppBar(context),
      body: const PostsList(),
      backgroundColor: Colors.grey[400],
    );
  }
}
