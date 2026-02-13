import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_app/core/constant/app_icon.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';

class GoogleButton extends StatefulWidget { 
  const GoogleButton({Key? key}) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool isLoading = false;

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    setState(() => isLoading = true); 

    String? result = await FirebaseAuthAuthentication.signInWithGoogle();

    if (!mounted) return;
    setState(() => isLoading = false); 

    if (result == "Success") {
  
       Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => HomeScreen())
       );
    } else if (result != "Cancelled") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $result")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : () => _handleGoogleSignIn(context),
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
      child: isLoading 
        ? const SizedBox(
            width: 24, 
            height: 24, 
            child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xff5F33E1))
          )
        : SvgPicture.asset(AppIcon.googleIcon, width: 28, height: 28),
    );
  }
}