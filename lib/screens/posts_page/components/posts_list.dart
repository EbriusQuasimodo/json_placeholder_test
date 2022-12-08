import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

final posts = List<String>.generate(30, (index) => 'post $index');

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return _buildPostItem(index);
      },
    );
  }

  Container _buildPostItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Text(
              posts[index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
            child: const Text(
              'asdasdasdsdasdjladhjkahfkjahfkjasdhjasueiowajdlsdka/.s,djklsasd',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
