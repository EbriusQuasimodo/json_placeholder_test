import 'package:flutter/material.dart';

AppBar PostsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: const Text(
      'Posts',
      style: TextStyle(
        color: Colors.black54,
      ),
    ),
    centerTitle: true,
  );
}
