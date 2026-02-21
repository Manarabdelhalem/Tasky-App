import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasky_app/core/constant/app_image.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/model/task_model.dart';
import 'package:tasky_app/features/Home/view/update_task_screen.dart';
import 'package:tasky_app/features/Home/widget/calendar_widget.dart';
import 'package:tasky_app/features/Home/widget/flag.dart';
import 'package:tasky_app/features/Home/widget/flag_container.dart';
import 'package:tasky_app/features/Home/widget/show_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({super.key});
   static const String routeName="/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final isSelected=true;

   int priority=0;

DateTime selectedDate=DateTime.now();

TextEditingController titleController=TextEditingController();

TextEditingController descriptionController=TextEditingController();
List<TaskModel> tasksList=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
  }
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
       , Expanded(
         child: ListView.separated(
          itemCount:tasksList.length ,
          itemBuilder: (context, index){
         return  GestureDetector(
           onTap: (){
           // Navigator.pushNamed(context, UpdateTaskScreen.routeName, arguments: tasksList[index]);
           Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateTaskScreen(task: tasksList[index],)));
           },
           child: Container(
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
                Text(tasksList[index].title,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                Text("Today ${tasksList[index].date.day}/${tasksList[index].date.month}/${tasksList[index].date.year}", style: TextStyle(fontSize: 14, color: Colors.grey),)
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
                      Text(tasksList[index].priority.toString(), style: TextStyle(color: Colors.black),)
                    ],
                  ),
                )
                ],
              ),
            ),
         );
         }, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: 12,);
         },
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
            titleController: titleController,
             descriptionController: descriptionController,
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
ontapSend: () async{
  log(" Title: ${titleController.text}");
  log(" Description: ${descriptionController.text}");
  log(" Priority: $priority");
  log(" Date: $selectedDate");
  try{
    
    AppDialog.showDialogLoading(context);
 await FireBaseStore.addTask(task: TaskModel(
    id:FireBaseStore.collectionTasks().doc().id,
    title: titleController.text, 
    description: descriptionController.text, 
    priority: priority,
    date: DateTime.now())  ).then((_){
      titleController.clear();
      descriptionController.clear();
      priority=0;
      selectedDate=DateTime.now();
        Navigator.pop(context);
        Navigator.pop(context);
        getTasks();
    });


  }catch(e){
    AppDialog.showErrorDialog(context, e.toString());
    Navigator.pop(context);
  }
  
},
          );
         })  ;
        },
        backgroundColor:Color(0xff24252C) ,
        child: const Icon(Icons.add,color:Color(0xff5F33E1) ,),
      ),
    );
  }
 Future<void> getTasks()async{
  final  fetchData= await FireBaseStore.getAllTasks();
setState(() {
  tasksList=fetchData;
  
});
  }
}