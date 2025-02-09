import 'package:get_it/get_it.dart';
import 'package:instagram_clone/features/posts/data/datasources/posts_local.dart';
import 'package:instagram_clone/features/posts/data/repositories/posts_repo_impl.dart';
import 'package:instagram_clone/features/posts/domain/repositories/posts_repo.dart';
import 'package:instagram_clone/features/posts/domain/usecases/get_posts.dart';
import 'package:instagram_clone/features/posts/presentation/bloc/post_bloc.dart';

final sl = GetIt.instance;

void registerDependencies() {
  // REGISTER POST BLOC
  sl.registerFactory(() => PostBloc(sl()));

  //REGISTER POST USECASES
  sl.registerLazySingleton<GetPosts>(() => GetPosts(sl()));

  // REGISTER POST REPOSITORY
  sl.registerLazySingleton<PostRepository>(() => PostsRepoImpl(sl()));

// REGISTER POST SOURCES
  sl.registerLazySingleton<PostsLocal>(() => PostLocalImpl());

  
}
