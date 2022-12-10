part of 'post_bloc.dart';

enum PostStatus { initial, loading, loaded, error }

@immutable
class PostState {
  const PostState._({
    this.status = PostStatus.initial,
    this.loadedPosts = const <PostModel>[],
    required this.currentPage,
  });

  final PostStatus status;
  final List<PostModel> loadedPosts;
  final int currentPage;

  const PostState.initial() : this._(currentPage: 0);

  const PostState.loading({required int currentPage})
      : this._(
          status: PostStatus.loading,
          currentPage: currentPage,
        );

  const PostState.loaded(
      {required List<PostModel> loadedPosts, required int currentPage})
      : this._(
          status: PostStatus.loaded,
          loadedPosts: loadedPosts,
          currentPage: currentPage,
        );

  const PostState.error({required int currentPage})
      : this._(status: PostStatus.error, currentPage: 0);
}
