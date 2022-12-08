import 'package:flutter/material.dart';
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
      home: const PostsPage(),
    );
  }
}
