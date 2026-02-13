import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Auth/view/screen/auth_gate.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';
import 'package:tasky_app/features/splash/splash_screen.dart';
import 'package:tasky_app/firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 
  
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print("--- Firebase Initialized ---");
  } catch (e) {
    print("--- Firebase Error: $e ---");
  }

  runApp(
    DevicePreview(
      enabled: true, // Set to true to enable device preview
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home: SplashScreen(),
    // home: AuthGate(),
    home: HomeScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue,
//         body: Center(child: Text("Hello World! I am working")),
//       ),
//     );
//   }
// }