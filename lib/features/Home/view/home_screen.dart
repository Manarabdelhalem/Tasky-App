import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/model/task_model.dart';
import 'package:tasky_app/features/Home/view/empty_home_screen.dart';
import 'package:tasky_app/features/Home/view/update_task_screen.dart';
import 'package:tasky_app/features/Home/widget/compelet_widget.dart';
import 'package:tasky_app/features/Home/widget/flag.dart';

import 'package:tasky_app/features/Home/widget/show_bottom_sheet.dart';
import 'package:tasky_app/features/Home/widget/task_container.dart';

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
bool isCompeleted=false;

TextEditingController titleController=TextEditingController();

TextEditingController descriptionController=TextEditingController();
List<TaskModel> tasksList=[];

@override
 
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
body: StreamBuilder<List<TaskModel>>(
  stream: FireBaseStore.getAllTasks(), 
  builder: (context, snapshot) {
    
    if (snapshot.connectionState == ConnectionState.waiting) {
      // AppDialog.showDialogLoading(context);
       return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
     // AppDialog.showErrorDialog(context, snapshot.error.toString());
       return Center(child: Text("Something went wrong!"));
    }

    
    final allTasks = snapshot.data ?? [];
    final tasksList = allTasks.where((t) => !t.isCompeleted).toList();
    final completedTasksList = allTasks.where((t) => t.isCompeleted).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          tasksList.isEmpty
              ? SizedBox(height: 10)
              : TextFormFieldWidget(
                  hintText: "Search for your task...",
                  userNameController: TextEditingController(),
                  validator: null,
                  prefixIcon: Icons.search,
                ),
          SizedBox(height: 20),
          CompeletWidget(title: "Today"),
          SizedBox(height: 10),

          Expanded(
            flex: 1,
            child: tasksList.isEmpty
                ? EmptyHomeScreen()
                : ListView.separated(
                    itemCount: tasksList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return TaskContainer(
                        tasksList: tasksList,
                        index: index,
                        isCompleted: tasksList[index].isCompeleted,
                        onChanged: (value) async {
                          await FireBaseStore.changeTaskStatus(
                              tasksList[index].id, value!);
                      
                        },
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  UpdateTaskScreen(task: tasksList[index]),
                            ),
                          );
                       
                        },
                      );
                    },
                  ),
          ),

          SizedBox(height: 16),

        
          if (completedTasksList.isNotEmpty) ...[
            Divider(thickness: 1.5),
            SizedBox(height: 8),
            CompeletWidget(title: "Completed"),
            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: ListView.separated(
                itemCount: completedTasksList.length,
                separatorBuilder: (_, __) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return TaskContainer(
                    tasksList: completedTasksList,
                    index: index,
                    isCompleted: completedTasksList[index].isCompeleted,
                    onChanged: (value) async {
                      await FireBaseStore.changeTaskStatus(
                          completedTasksList[index].id, value!);
                    },
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UpdateTaskScreen(
                              task: completedTasksList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  },
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
 }