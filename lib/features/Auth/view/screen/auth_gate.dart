// ملف جديد مثلاً باسم auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';
import 'package:tasky_app/features/onboarding/view/screen/onboarding_screen.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const HomeScreen(); // إذا مسجل دخوله يذهب للهوم
//         } else {
//           return const OnboardingScreen(); // إذا لم يسجل يذهب للـ Onboarding
//         }
//       },
//     );
//   }
// }

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
       
        if (!snapshot.hasData) {
          return const OnboardingScreen();
        }

        User user = snapshot.data!;
        if (user.emailVerified) {
          return  HomeScreen(); 
        } else {
          return OnboardingScreen();
          
        }
      },
    );
  }
}