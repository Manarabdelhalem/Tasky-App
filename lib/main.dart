import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/shared_preference_file.dart';
import 'package:tasky_app/features/Auth/view/screen/auth_gate.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';
import 'package:tasky_app/features/Auth/view/screen/register_screen.dart';
import 'package:tasky_app/features/Auth/view/screen/verify_code.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';
import 'package:tasky_app/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:tasky_app/features/splash/splash_screen.dart';
import 'package:tasky_app/firebase_options.dart';

void main() async {
  String routeName=LoginScreen.routeName;
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceFile.initSharedPreference();
  await SharedPreferenceFile.getData("Id").then((value)=>{
    if(value!=null){
log(  "User ID found in SharedPreferences: $value"),
routeName=HomeScreen.routeName,
    }
 
  });
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    DevicePreview(
      enabled: true, 
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) =>  MyApp(routName: routeName),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.routName});
  final String routName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: SplashScreen.routeName,
      initialRoute: routName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        AuthGate.routeName: (context) => const AuthGate(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        VerifyCodeScreen.routeName: (context) =>  VerifyCodeScreen(),
        HomeScreen.routeName: (context) =>  HomeScreen(),
      },
    );
  }
}

