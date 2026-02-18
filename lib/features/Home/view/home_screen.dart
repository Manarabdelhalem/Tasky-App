import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/widget/calendar_widget.dart';
import 'package:tasky_app/features/Home/widget/flag.dart';
import 'package:tasky_app/features/Home/widget/flag_container.dart';
import 'package:tasky_app/features/Home/widget/show_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   static const String routeName="/homeScreen";
   final isSelected=true;
   int priority=0;
DateTime selectedDate=DateTime.now();
TextEditingController titleController=TextEditingController();
TextEditingController descriptionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.red,),
            onPressed: ()async {
              await FirebaseUserAuthentication.signOut();
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
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldWidget(hintText: "Search for your task...",
             userNameController: TextEditingController(), 
             validator: null, prefixIcon: Icons.search,),
              SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Today", style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                ],
              ),
            )
        ,Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
           decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)
              ),
          child: Row(
            children: [
        
        Radio(value:  true, ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Do Math Homework",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            Text("Today At 16:45", style: TextStyle(fontSize: 14, color: Colors.grey),)
          ],
        ),
        Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Row(
                children: [
                  Icon(Icons.flag_outlined, color: Colors.deepPurple, size: 19,),
                  SizedBox(width: 4,),
                  Text("1", style: TextStyle(color: Colors.black),)
                ],
              ),
            )
            ],
          ),
        )
        
          ],
        ),
      ) ,
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
            
               showDialog(context: context, builder: (builder)=> FlagWindow(onFlagSelected: (int p1) { 
                log(  "Selected Flag Index: $p1");
                priority=p1;
                
                },

               ));
             },
             ontapCalendar: () {
                //showDialog(context: context, builder: (builder)=> CalendarWidget(context));

             },
ontapSend: () {
  log(" Title: ${titleController.text}");
  log(" Description: ${descriptionController.text}");
  log(" Priority: $priority");
  log(" Date: $selectedDate");
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