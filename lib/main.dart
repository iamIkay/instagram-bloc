import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/features/posts/presentation/bloc/post_bloc.dart';
import 'package:instagram_clone/splash.dart';
import 'package:instagram_clone/wrapper.dart';

import 'core/injection_container.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(
            create: (context) => sl.get<PostBloc>()..add(GetPostsEvent())),
      ],
      child: MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const SplashScreen(),
      ),
    );
  }
}
