import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky_app/core/constant/app_image.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});
  static const String routeName="/emptyHomeScreen";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset(AppImage.homeImage),
            SizedBox(height: 20),
            Text("What do you want to do today?", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.grey),),
            SizedBox(height: 10),
            Text("Tap + to add your tasks", style: TextStyle(fontSize: 18, color: Colors.grey),),
            SizedBox(height: 40),
           
          ],
        ),
        
      );
  }
}