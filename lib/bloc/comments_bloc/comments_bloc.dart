import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/models/comments_model.dart';
import 'package:test_task/resources/post_repository.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final PostRepository postRepository;
  final int postId;

  CommentsBloc({required this.postRepository, required this.postId})
      : super(const CommentsState.initial()) {
    on<GetCommentsEvent>(
      (event, emit) async {
        if (event.shouldShowProgress) {
          emit(
            CommentsState.loading(id: postId),
          );
        }
        final List<CommentsModel> loadedComments =
            await postRepository.fetchAllComments(postId: postId);
        emit(
          CommentsState.loaded(
            loadedComments: List.of(state.loadedComments)
              ..addAll(loadedComments),
            id: postId,
          ),
        );
      },
    );
  }
}
