import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostCarousel extends StatefulWidget {
  final List<String> media;

  const PostCarousel(this.media, {super.key});

  @override
  State<PostCarousel> createState() => _PostCarouselState();
}

class _PostCarouselState extends State<PostCarousel> {
  int _current = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            children: widget.media
                .map((media) => CachedNetworkImage(
                      imageUrl: media,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      progressIndicatorBuilder: (context, _, p) =>
                          CupertinoActivityIndicator(),
                    ))
                .toList()),
        widget.media.length > 1
            ? Positioned(
                bottom: 10.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2.0, vertical: 3.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.media.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(
                                _current == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
