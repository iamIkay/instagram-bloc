import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/text-logo.svg",
            // height: 70.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              const Icon(CupertinoIcons.heart, size: 26.0),
              const SizedBox(width: 16.0),
              SvgPicture.asset("assets/chat.svg")
            ],
          )
        ],
      ),
    );
  }
}
