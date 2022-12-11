import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_task/models/post_model.dart';
import 'package:test_task/resources/post_repository.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState.initial()) {
    on<GetPostEvent>(
      (event, emit) async {
        if (event.shouldShowProgress) {
          emit(
            PostState.loading(currentPage: state.currentPage),
          );
        }
        try {
          final List<PostModel> loadedPosts =
              await postRepository.fetchAllPosts(page: state.currentPage + 1);
          emit(
            PostState.loaded(
              loadedPosts: List.of(state.loadedPosts)..addAll(loadedPosts),
              currentPage: state.currentPage + 1,
            ),
          );
        } catch (_) {
          PostState.error(currentPage: state.currentPage);
        }
      },
    );
  }
}
