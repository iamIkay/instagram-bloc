import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/widgets/app_bar.dart';
import 'features/posts/presentation/bloc/post_bloc.dart';
import 'features/posts/presentation/pages/posts.dart';
import 'widgets/stories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.read<PostBloc>().add(GetMorePostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              controller: _scrollController,
              children: const [
                // APP BAR
                DefaultAppBar(),

                //STORIES
                Stories(),

                //POSTS
                Posts()
              ],
            )),
      ),
    );
  }
}
