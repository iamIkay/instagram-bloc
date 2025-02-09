import 'package:dartz/dartz.dart';
import 'package:instagram_clone/core/error/failure.dart';
import 'package:instagram_clone/features/posts/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/posts/domain/repositories/posts_repo.dart';

import '../datasources/posts_local.dart';

class PostsRepoImpl implements PostRepository {
  final PostsLocal localSource;
  const PostsRepoImpl(this.localSource);

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts(
      {required int page}) async {
    try {
      final results = await localSource.getPosts(page);

      return Right(results);
    } catch (err) {
      throw ServerFailure(err.toString());
    }
  }
}
