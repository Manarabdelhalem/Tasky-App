// ملف جديد مثلاً باسم auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Home/home_screen.dart';
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
        // 1. إذا لم يكن هناك مستخدم مسجل
        if (!snapshot.hasData) {
          return const OnboardingScreen();
        }

        // 2. إذا وجد مستخدم، نتحقق هل فعل الإيميل أم لا
        User user = snapshot.data!;
        if (user.emailVerified) {
          return  HomeScreen(); // مفعل -> اذهب للهوم
        } else {
          return OnboardingScreen();
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("you must verify your email first"), backgroundColor: Colors.green),
          //   );
         // return const VerifyEmailScreen(); // غير مفعل -> صفحة تطلب منه التفعيل
        }
      },
    );
  }
}