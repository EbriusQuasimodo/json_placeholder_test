import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/comments_bloc/comments_bloc.dart';
import 'package:test_task/models/comments_model.dart';
import 'package:test_task/resources/post_repository.dart';

class CommentsList extends StatefulWidget {
  final int postId;

  const CommentsList({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  PostRepository postRepository = PostRepository();

  late final CommentsBloc _bloc =
      CommentsBloc(postRepository: postRepository, postId: widget.postId)
        ..add(GetCommentsEvent(shouldShowProgress: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _bloc,
        child: _commentsBloc(context),
      ),
    );
  }

  Widget _commentsBloc(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state.status == CommentsStatus.error) {
          return const Center(child: Text('комментарии не найдены((('));
        }
        if (state.status == CommentsStatus.loading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.status == CommentsStatus.loaded) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildCommentsItem(state.loadedComments[index]);
            },
            itemCount: state.loadedComments.length,
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _buildCommentsItem(CommentsModel comment) {
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
      margin: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: ClipOval(
                child: Image.asset(
              'assets/images/photo.jpg',
              height: 68,
              width: 68,
              fit: BoxFit.fill,
            )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                  child: Text(
                    comment.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, top: 15, bottom: 15, right: 15),
                  child: Text(
                    comment.body,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
