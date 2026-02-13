import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Home/widget/calendar_widget.dart';
import 'package:tasky_app/features/Home/widget/flag.dart';
import 'package:tasky_app/features/Home/widget/show_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
final isSelected=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red,),
            onPressed: ()async {
              await FirebaseAuthAuthentication.signOut();
            },
          ),
          Text("Log out", style: TextStyle(color: Colors.red,fontSize: 18),),
          SizedBox(width: 10,),
        ],
        title: RichText(text:   TextSpan(
          children: [
            TextSpan(text: "Task", style: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.bold, color: Colors.black)),
            TextSpan(text: "y", style: TextStyle(color: Color(0xFFF5F876), fontWeight: FontWeight.bold, fontSize: 24)),
          ]
        )),
      ),
      body: Center(
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
        
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        onPressed: () {
       showModalBottomSheet(context: context,
         isScrollControlled: true,
          builder: (context){
          return ShowBottomSheet( 
            titleController: TextEditingController(),
             descriptionController: TextEditingController(),
             ontapflag: () {
              log(  "flag tapped");
               showDialog(context: context, builder: (builder)=> FlagWindow());
             },

          );
         })  ;
        },
        backgroundColor:Color(0xff24252C) ,
        child: const Icon(Icons.add,color:Color(0xff5F33E1) ,),
      ),
    );
  }
}