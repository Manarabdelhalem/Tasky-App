import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/Home/home_screen.dart';
import 'package:tasky_app/features/onboarding/view/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>OnboardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff5F33E1) ,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 800),
              child: Image.asset(AppImage.taskLogo)),
             FadeInUp(
              delay: Duration(milliseconds: 200),
              duration: Duration(milliseconds: 800),
              child: Image.asset(AppImage.yLogo)),
          ],
        ),
      ),
    );
  }
}