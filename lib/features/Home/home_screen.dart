import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
 const  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("Home Screen"),
            SizedBox(height: 20),
           ElevatedButton(
            onPressed: ()async{
            await FirebaseAuthAuthentication.signOut();
           }, child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}