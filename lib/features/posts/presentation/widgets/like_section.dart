import 'package:flutter/material.dart';

class LikeSection extends StatelessWidget {
  const LikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50.0,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 9.0,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage("assets/images/story4.png"),
                    ),
                    Positioned(
                      left: 12.0,
                      child: CircleAvatar(
                        radius: 9.0,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage("assets/images/story6.png"),
                      ),
                    ),
                    Positioned(
                      left: 24.0,
                      child: CircleAvatar(
                        radius: 9.0,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage("assets/images/story8.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                  text: const TextSpan(
                      style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                      text: "Liked by ",
                    ),
                    TextSpan(
                        text: "kyia_kayaks ",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    TextSpan(
                      text: "and ",
                    ),
                    TextSpan(
                        text: "others",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                  ]))
            ],
          )
        ],
      ),
    );
  }
}
