part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class GetPostsEvent extends PostEvent {
  GetPostsEvent();
}

class GetMorePostsEvent extends PostEvent {
  GetMorePostsEvent();
}
