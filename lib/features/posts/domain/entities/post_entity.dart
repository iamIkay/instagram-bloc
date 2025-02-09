import 'package:equatable/equatable.dart';

import '../../../../models/user.dart';

class PostEntity extends Equatable {
  final User user;
  final List<String> images;
  final String caption;

  const PostEntity(
      {required this.user, required this.caption, required this.images});

  @override
  List<Object?> get props => [user, caption];
}
