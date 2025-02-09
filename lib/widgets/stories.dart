import 'package:flutter/material.dart';

import '../models/story.dart';
import '../models/user.dart';
import 'story_preview.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.0,
      margin: const EdgeInsets.only(top: 12.0),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        children: [
          const UserStory(),
          const SizedBox(width: 12.0),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return StoryPreview(stories[index]);
              },
              separatorBuilder: (_, index) {
                return const SizedBox(width: 12.0);
              },
              itemCount: stories.length),
        ],
      ),
    );
  }
}

const stories = [
  Story(user: User(name: "jaded.ella", avi: "assets/images/story6.png")),
  Story(user: User(name: "pia.in.a.pod", avi: "assets/images/story2.png")),
  Story(
      user: User(name: "lil.wyatt838", avi: "assets/images/story8.jpg"),
      isSeen: true),
  Story(
      user: User(name: "freeman.m", avi: "assets/images/story5.png"),
      isSeen: true),
  Story(user: User(name: "sandy13", avi: "assets/images/story4.png")),
  Story(user: User(name: "chloe.han", avi: "assets/images/story3.png")),
];
