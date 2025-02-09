import 'package:flutter/material.dart';

import '../models/story.dart';

class UserStory extends StatelessWidget {
  const UserStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.transparent),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[50],
            backgroundImage: const AssetImage("assets/images/story.png"),
            radius: 28.0,
          ),
        ),
        const SizedBox(height: 4.0),
        const Expanded(
            child: Text("Your story",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500)))
      ],
    );
  }
}

class StoryPreview extends StatelessWidget {
  final Story story;
  const StoryPreview(this.story, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: story.isSeen
                ? null
                : const LinearGradient(
                    colors: [
                      Color(0xFFFEDA77),
                      Color(0xFFFA7E1E),
                      Color(0xFFD62976),
                      Color(0xFF962FBF),
                      Color(0xFF4F5BD5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(story.user.avi),
              backgroundColor: Colors.grey[100],
              radius: 28.0,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Expanded(
            child: SizedBox(
          width: 64.0,
          child: Text(story.user.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11.0,
                  color: story.isSeen ? Colors.grey : Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis)),
        ))
      ],
    );
  }
}
