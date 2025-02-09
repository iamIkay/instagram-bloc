import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/features/posts/presentation/widgets/comment_section.dart';
import 'package:like_button/like_button.dart';

class PostActions extends StatefulWidget {
  const PostActions({super.key});

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LikeButton(
                  padding: EdgeInsets.zero,
                  size: 28.0,
                  likeCountPadding: EdgeInsets.zero,
                  likeBuilder: (isLiked) => !isLiked
                      ? const Icon(
                          CupertinoIcons.heart,
                          size: 28.0,
                        )
                      : const Icon(CupertinoIcons.heart_fill,
                          size: 28.0, color: Colors.red),
                ),
                const SizedBox(width: 12.0),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14.0),
                                topRight: Radius.circular(14.0))),
                        builder: (context) {
                          return const CommentSection();
                        });
                  },
                  child: SvgPicture.asset(
                    "assets/comment.svg",
                  ),
                ),
                const SizedBox(width: 12.0),
                SvgPicture.asset(
                  "assets/share.svg",
                  // height: 12.0,
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.bounceIn,
                switchOutCurve: Curves.linear,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: isBookmarked
                    ? SvgPicture.asset("assets/bookmark-filled.svg",
                        // height: 12.0,
                        key: const ValueKey(1))
                    : SvgPicture.asset("assets/bookmark.svg",
                        // height: 12.0,
                        key: const ValueKey(0)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
