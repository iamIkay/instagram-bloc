part of 'post_bloc.dart';

@immutable
sealed class PostState {
  final List<PostEntity> posts;

  const PostState({this.posts = const []});
}

final class PostsInitial extends PostState {}

final class GetPostsLoading extends PostState {
  const GetPostsLoading();
}

final class GetMorePostsLoading extends PostState {
  const GetMorePostsLoading({required super.posts});
}

final class GetPostsSuccess extends PostState {
  const GetPostsSuccess({required super.posts});
}

final class GetPostsFailed extends PostState {
  final Failure error;

  const GetPostsFailed(this.error);
}
