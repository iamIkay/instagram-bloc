import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/core/error/failure.dart';
import 'package:instagram_clone/features/posts/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/posts/domain/usecases/get_posts.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc(this.getPosts) : super(PostsInitial()) {
    on<GetPostsEvent>(_getPosts);
    on<GetMorePostsEvent>(_getMorePosts);
  }
  int _currentPage = 1;
  void _getPosts(event, emit) async {
    emit(const GetPostsLoading());
    final Either<Failure, List<PostEntity>> result =
        await getPosts.execute(page: _currentPage); //event.page);

    result.fold((error) => emit(GetPostsFailed(error)), (res) {
      _currentPage++;
      emit(GetPostsSuccess(posts: res));
    });
  }

  void _getMorePosts(event, emit) async {
    if (state is GetMorePostsLoading) return;

    emit(GetMorePostsLoading(posts: state.posts));

    final Either<Failure, List<PostEntity>> result =
        await getPosts.execute(page: _currentPage); //event.page);

    result.fold((error) => emit(GetPostsFailed(error)), (res) {
      _currentPage++;
      emit(GetPostsSuccess(posts: [...state.posts, ...res]));
    });
  }
}
