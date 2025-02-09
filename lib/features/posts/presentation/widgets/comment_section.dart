import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.65,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 12.0),
                Container(
                  height: 5.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                const SizedBox(height: 9.0),
                const SizedBox(
                  width: double.infinity,
                  height: 20.0,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text("Comments",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      Positioned(right: 16.0, child: Icon(Icons.info_outline)),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              bottom: 100.0,
              top: 56.0,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 16.0,
                      backgroundImage:
                          const AssetImage("assets/images/story8.jpg"),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("peter_cee888",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0)),
                            Text(
                              "Bonus: Enhance interactivity with animations and interactive icons (e.g., like button, comments section).",
                              maxLines: 2,
                              style: TextStyle(fontSize: 11.0),
                            ),
                            SizedBox(height: 6.0),
                            Text("Reply",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                    fontSize: 10.0)),
                            SizedBox(height: 12.0),
                            Padding(
                              padding: EdgeInsets.only(left: 32.0),
                              child: Text("View 24 more replies",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      fontSize: 10.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Icon(
                          CupertinoIcons.heart,
                          size: 14.0,
                        ),
                        SizedBox(height: 4.0),
                        Text("450",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 11.0)),
                      ],
                    )
                  ],
                ),
                separatorBuilder: (_, index) => const SizedBox(
                  height: 20.0,
                ),
                itemCount: 6,
              ),
            ),
            Positioned(
                bottom: 10.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          suggestions.length,
                          (index) => Expanded(
                                child: Text(
                                  suggestions[index],
                                  style: const TextStyle(fontSize: 26.0),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            radius: 18.0,
                            backgroundImage:
                                const AssetImage("assets/images/story.png"),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: TextFormField(
                                cursorColor: Colors.black54,
                                style: const TextStyle(fontSize: 13.0),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14.0, vertical: 9.0),
                                  isDense: true,
                                  hintText: "Add a comment...",
                                  hintStyle: const TextStyle(fontSize: 13.0),
                                  suffixIconConstraints: const BoxConstraints(),
                                  suffixIcon: Container(
                                    // color: Colors.amberAccent,
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: SvgPicture.asset(
                                      "assets/sticker.svg",
                                      height: 28.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]!,
                                          width: 0.5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey[500]!,
                                          width: 0.5)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

var suggestions = ["😂", "😍", "🤪", "🔥", "🤯", "❤️", "👏", "💪"];
