import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/home_page.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changeIndex(int newIndex) {
    emit(newIndex);
  }
}

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            BlocBuilder<BottomNavCubit, int>(builder: (context, currentIndex) {
          return IndexedStack(index: currentIndex, children: const [
            HomePage(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ]);
        }),
        bottomNavigationBar: const AppBottomNavBar());
  }
}

class AppBottomNavBar extends StatelessWidget {
  final VoidCallback? onTap;
  const AppBottomNavBar({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BlocBuilder<BottomNavCubit, int>(builder: (context, currentIndex) {
        // final currentIndex = ref.watch(bottomNavIndexProvider);
        return BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/home.svg"),
                activeIcon: SvgPicture.asset(
                  "assets/home-filled.svg",
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/search.svg"), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/add-btn.svg",
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/reels.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/reels-filled.svg",
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/avatar.svg",
                ),
                label: ''),
          ],
          onTap: (value) {
            context.read<BottomNavCubit>().changeIndex(value);
          },
        );
      }),
    );
  }
}
