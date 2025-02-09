import 'user.dart';

class Story {
  final User user;
  final bool isSeen;

  const Story({required this.user, this.isSeen = false});
}
