import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeedSkeleton extends StatelessWidget {
  const FeedSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Shimmer.fromColors(
                highlightColor: const Color(0xffF6F7FB),
                baseColor: Colors.grey[350]!,
                child: Container(
                  height: 30.0,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Shimmer.fromColors(
                highlightColor: const Color(0xffF6F7FB),
                baseColor: Colors.grey[350]!,
                child: Container(
                  height: 12.0,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Shimmer.fromColors(
          highlightColor: const Color(0xffF6F7FB),
          baseColor: Colors.grey[350]!,
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.5),
            width: double.infinity,
            color: Colors.black45,
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                highlightColor: const Color(0xffF6F7FB),
                baseColor: Colors.grey[350]!,
                child: Container(
                  height: 10.0,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Shimmer.fromColors(
                highlightColor: const Color(0xffF6F7FB),
                baseColor: Colors.grey[350]!,
                child: Container(
                  height: 10.0,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
