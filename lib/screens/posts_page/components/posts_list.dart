import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/post_bloc.dart';
import 'package:test_task/models/post_model.dart';
import 'package:test_task/resources/post_repository.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  PostRepository postRepository = PostRepository();

  late final PostBloc _bloc = PostBloc(postRepository: postRepository)
    ..add(GetPostEvent(shouldShowProgress: true));

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          _bloc.add(GetPostEvent(shouldShowProgress: false));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _bloc,
        child: _postBloc(context),
      ),
    );
  }

  Widget _postBloc(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state.status == PostStatus.error) {
        return const Text('error');
      }
      if (state.status == PostStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.status == PostStatus.loaded) {
        return ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            if (index >= state.loadedPosts.length) {
              return const CupertinoActivityIndicator();
            } else {
              return _buildPostItem(state.loadedPosts[index]);
            }

            //return _buildPostItem(state.loadedPosts!.posts[index]);
          },
          itemCount: state.loadedPosts.length + 1,
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _buildPostItem(PostModel posts) {
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
              posts.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
            child: Text(
              posts.body,
              style: const TextStyle(
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
