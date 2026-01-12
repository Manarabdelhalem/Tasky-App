import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_app/core/constant/app_icon.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({Key? key}) : super(key: key);

  // دالة تسجيل الدخول باستخدام Google
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      // استخدام GoogleSignIn لتسجيل الدخول
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // بدء عملية تسجيل الدخول
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // إذا انصرف المستخدم قبل إنهاء تسجيل الدخول
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Google Sign-In cancelled")),
        );
        return;
      }

      // احصل على تفاصيل المصادقة من Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // إنشاء بيانات الاعتماد لـ Firebase باستخدام idToken فقط
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // تسجيل الدخول باستخدام بيانات الاعتماد
      await FirebaseAuth.instance.signInWithCredential(credential);

      // عرض رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google Sign-In successful!")),
      );
    } catch (e) {
      // عرض رسالة خطأ عند حدوث مشكلة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Google Sign-In error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _signInWithGoogle(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey,
        elevation: 0,
        minimumSize: const Size(56, 56),
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: SvgPicture.asset(
        AppIcon.googleIcon,
        width: 28,
        height: 28,
      ),
    );
  }
}