part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPostEvent extends PostEvent {
  final bool shouldShowProgress;

  GetPostEvent({required this.shouldShowProgress});
}
