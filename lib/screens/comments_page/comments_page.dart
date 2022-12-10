import 'package:flutter/material.dart';
import 'package:test_task/screens/comments_page/components/comments_app_bar.dart';
import 'package:test_task/screens/comments_page/components/comments_list.dart';

class CommentsPage extends StatelessWidget {
  final int postId;

  const CommentsPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommentsAppBar(context),
      body: CommentsList(postId: postId),
      backgroundColor: Colors.grey[400],
    );
  }
}
