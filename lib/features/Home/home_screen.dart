import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';

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
         showModalBottomSheet(context: context, builder: (context){
          return Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add  task ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
              SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Do math Homework"
                    ),
                  ),
                  SizedBox(height: 20,),
                   TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Description "
                    ),
                  ),
              
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                          //  IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month,color: Color(0xff5F33E1) ,)),
                          // أضف هذا الاستيراد في الأعلى


// داخل الـ IconButton الخاص بالتقويم:
IconButton(
  onPressed: () async {
    var results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: const Color(0xff5F33E1),
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        // تخصيص شكل الأيام لتشبه الصورة التي أرفقتها
        dayBuilder: ({
          required date,
          decoration,
          isFirstSelectableDate,
          isLastSelectableDate,
          isSelected,
          isDisabled,
          isToday,
          textStyle,
        }) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              // المربعات السوداء للأيام العادية والأرجواني للمختار
              color: isSelected! ? const Color(0xff5F33E1) : const Color(0xff24252C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      dialogSize: const Size(325, 400),
      value: [], // التاريخ الابتدائي
      borderRadius: BorderRadius.circular(15),
    );

    if (results != null && results.isNotEmpty) {
       print("التاريخ المختار: ${results[0]}");
       // يمكنك هنا تخزين التاريخ في متغير الحالة (State)
    }
  },
  icon: const Icon(Icons.calendar_month, color: Color(0xff5F33E1)),
),
                  SizedBox(width: 5,),
                     IconButton(onPressed: (){}, icon: Icon(Icons.flag,color:Color(0xff5F33E1)  ,)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.send,color: Color(0xff5F33E1) ,))
                  ],
                  
                  ),
              )
                ,
                ],
              ),
            ),
          );
         });
        },
        backgroundColor:Color(0xff24252C) ,
        child: const Icon(Icons.add,color:Color(0xff5F33E1) ,),
      ),
    );
  }
}