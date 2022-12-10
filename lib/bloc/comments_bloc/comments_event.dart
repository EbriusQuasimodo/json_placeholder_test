part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent {
  final bool shouldShowProgress;

  GetCommentsEvent({required this.shouldShowProgress});
}