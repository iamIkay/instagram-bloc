import 'package:flutter/material.dart';
import 'package:instagram_clone/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleRoute();
  }

  void handleRoute() async {
    await Future.delayed(const Duration(milliseconds: 1500), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainWrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 90.0,
              width: 90.0,
            ),
            Positioned(
                bottom: 80.0,
                child: Image.asset(
                  "assets/meta.png",
                  height: 40.0,
                ))
          ],
        ),
      ),
    );
  }
}
