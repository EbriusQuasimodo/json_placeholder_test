part of 'comments_bloc.dart';

enum CommentsStatus { initial, loading, loaded, error }

@immutable
class CommentsState {
  const CommentsState._({
    this.status = CommentsStatus.initial,
    this.loadedComments = const <CommentsModel>[],
    required this.id,
  });

  final CommentsStatus status;
  final List<CommentsModel> loadedComments;
  final int id;

  const CommentsState.initial() : this._(id: 0);

  const CommentsState.loading({required int id})
      : this._(
          status: CommentsStatus.loading,
          id: id,
        );

  const CommentsState.loaded(
      {required List<CommentsModel> loadedComments, required int id})
      : this._(
          status: CommentsStatus.loaded,
          loadedComments: loadedComments,
          id: id,
        );

  const CommentsState.error({required int id})
      : this._(status: CommentsStatus.error, id: 0);
}
