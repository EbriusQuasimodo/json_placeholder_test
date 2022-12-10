import 'package:flutter/material.dart';
import 'package:test_task/screens/comments_page/comments_page.dart';
import 'package:test_task/screens/posts_page/posts_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Placeholder',
      theme: ThemeData(
        primaryColor: Colors.white10,
        backgroundColor: Colors.black26,
      ),
      //home: const PostsPage(),
      routes: {
        "/posts_page": (context) => const PostsPage(),
        "/comments_page": (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return CommentsPage(
              postId: arguments,
            );
          } else {
            return const CommentsPage(
              postId: 0,
            );
          }
        },
      },
      initialRoute: "/posts_page",
    );
  }
}
