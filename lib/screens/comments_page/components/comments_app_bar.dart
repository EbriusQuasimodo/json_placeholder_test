import 'package:flutter/material.dart';

AppBar CommentsAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.2,
    title: const Text(
      'Comments',
      style: TextStyle(
        color: Colors.black54,
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_outlined,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
  );
}
