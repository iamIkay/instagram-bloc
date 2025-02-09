import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts({required int page});
}
