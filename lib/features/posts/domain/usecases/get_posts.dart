import 'package:dartz/dartz.dart';
import 'package:instagram_clone/features/posts/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/posts/domain/repositories/posts_repo.dart';

import '../../../../core/error/failure.dart';

class GetPosts {
  final PostRepository postRepo;

  const GetPosts(this.postRepo);

  Future<Either<Failure, List<PostEntity>>> execute({required int page}) async {
    final result = await postRepo.getPosts(page: page);

    return result;
  }
}
