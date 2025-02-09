import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/features/posts/presentation/widgets/feed_skeleton.dart';
import 'package:instagram_clone/features/posts/presentation/widgets/post.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/post_bloc.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is GetPostsLoading) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (_, index) => const FeedSkeleton(),
              separatorBuilder: (_, index) => const SizedBox(height: 30.0),
              itemCount: 4);
        }
        return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 16.0),
            itemBuilder: (_, index) {
              if (index == state.posts.length - 1) {
                return Column(
                  children: [
                    PostCard(state.posts[index]),
                    state is GetMorePostsLoading
                        ? Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Shimmer.fromColors(
                              highlightColor: const Color(0xFF962FBF),
                              baseColor: const Color(0xFFFA7E1E),
                              child: Container(
                                height: 4.0,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                );
              }
              return PostCard(state.posts[index]);
            },
            separatorBuilder: (_, index) => const SizedBox(height: 10.0),
            itemCount: state.posts.length);
      },
    );
  }
}
