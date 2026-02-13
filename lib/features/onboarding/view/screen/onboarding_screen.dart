import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';
import 'package:tasky_app/features/Auth/view/screen/register_screen.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';
import 'package:tasky_app/features/onboarding/model/onboarding_model.dart';
import 'package:tasky_app/features/onboarding/view/widget/onboard_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingPages = [OnboardingModel(imagePath: AppImage.onboarding1, title: "Manage your tasks", subTitle1: "You can easily manage all of your daily tasks in DoMe for free", subTitle2: ""),
  OnboardingModel(imagePath: AppImage.onboarding2, title: "Create daily routine", subTitle1: "  In Tasky  you can create your personalized routine to stay productive ", subTitle2: ""),
  OnboardingModel(imagePath: AppImage.onboarding3, title: "Organize your tasks", subTitle1: "You can organize your daily tasks by adding your tasks into separate categories", subTitle2: ""),
  ];
   PageController pageController=PageController();
   int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex=value;
                });
              },
              controller: pageController,
              itemCount: onboardingPages.length,
              itemBuilder: (BuildContext context, int index) { 
                return OnboardingWidget(model: onboardingPages[index], currentIndex: currentIndex, itemCount: onboardingPages.length,);
               },
              
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
                TextButton( 
                  onPressed: () {
                    Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text("Skip", style: TextStyle(color: Colors.grey)),
                ),
            
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5F33E1),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (currentIndex < onboardingPages.length - 1) {
                 
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
                    } else {
                     
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
                    }
                  },
                  child: Text(currentIndex == onboardingPages.length - 1 ? "Get Started" : "Next"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      
    );
  }
}

