import 'package:flutter/material.dart';
import 'package:instagram_clone/features/posts/domain/entities/post_entity.dart';

import 'package:instagram_clone/features/posts/presentation/widgets/like_section.dart';
import 'package:instagram_clone/features/posts/presentation/widgets/post_actions.dart';

import 'post_carousel.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  const PostCard(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.0,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(post.user.avi),
                  ),
                  const SizedBox(width: 10.0),
                  Text(post.user.name,
                      style: const TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600))
                ],
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.5),
            width: MediaQuery.sizeOf(context).width,
            child: PostCarousel(post.images)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PostActions(),
              const LikeSection(),
              const SizedBox(height: 4.0),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                          fontSize: 11.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                        text: "${post.user.name} ",
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(
                      text: post.caption,
                    ),
                  ]))
            ],
          ),
        )
      ],
    );
  }
}
