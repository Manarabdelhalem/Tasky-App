import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/onboarding/model/onboarding_model.dart';
import 'package:tasky_app/features/onboarding/view/widget/custom_indicator.dart';

class OnboardingWidget extends StatelessWidget {
   OnboardingWidget({super.key,required this.model, required this.currentIndex,required this.itemCount});

OnboardingModel model;
int currentIndex;
int itemCount;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
children: [
  Image.asset(model.imagePath),
 const SizedBox(height: 30),
 Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            itemCount,
            (index) => CustomIndecator(active: currentIndex == index),
          ),
        ),
  const SizedBox(height: 30),
  Text(model.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
        const SizedBox(height: 10),
  Text(model.subTitle1,style: const TextStyle(fontSize: 20, color: Colors.grey,),textAlign: TextAlign.center,),
],
    );
  }
}