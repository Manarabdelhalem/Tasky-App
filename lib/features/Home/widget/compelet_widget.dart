import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompeletWidget extends StatelessWidget {
  const CompeletWidget({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                ],
              ),
            );
  }
}

//Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //      tasksList.isEmpty? SizedBox(height: 10,) :    TextFormFieldWidget(hintText: "Search for your task...",
  //            userNameController: TextEditingController(), 
  //            validator: null, prefixIcon: Icons.search,),
  //             SizedBox(height: 20,),
  //           CompeletWidget(title: "Today"),
  //            SizedBox(height: 20,)
  //      ,tasksList.isEmpty? EmptyHomeScreen() :
  //       Expanded(
  //         flex: 1,
  //        child: ListView.separated(
  //         itemCount:tasksList.length ,
  //         itemBuilder: (context, index){
  //        return  TaskContainer(
  //         onTap: ()async{
        
  //       //  Navigator.push(
  //       //   context, MaterialPageRoute(builder: (context)=> UpdateTaskScreen(
  //       //     task: tasksList[index],)
  //       //     )
  //       //     ).then((_){
  //       //       getTasks();
  //       //     })
  //       //     ;
  //       bool isDeleted=await Navigator.push(
  //         context,
  //          MaterialPageRoute(
  //         builder: (context)=> UpdateTaskScreen(task: tasksList[index],)));
  //       if (isDeleted){
  //         getTasks();
  //       }
  //        },
  //         isCompleted: tasksList[index].isCompeleted,
  //         tasksList:tasksList,
  //         index: index,
  //         onChanged: (value) async {
  //   AppDialog.showDialogLoading(context);
  //   await FireBaseStore.changeTaskStatus(tasksList[index].id, value!);
  //   if (context.mounted) Navigator.pop(context);
  //   getTasks();
  //   getCompletedTasks();
  // },    
  //         );
  //        }, separatorBuilder: (BuildContext context, int index) { 
  //         return SizedBox(height: 12,);
  //        },
  //        ),
  //      ),
  //      completedTasksList.isEmpty? SizedBox() :        
  //      CompeletWidget(title: "Compeleted"),
  //      SizedBox(height: 20,), 
  //      Expanded(
  //       flex: 1,
  //        child: ListView.separated(itemBuilder: ((context,index){
  //         return TaskContainer(
  //           onTap: ()async{
          
  //         //  Navigator.push(
  //         //   context, MaterialPageRoute(builder: (context)=> UpdateTaskScreen(
  //         //     task: tasksList[index],)
  //         //     )
  //         //     ).then((_){
  //         //       getTasks();
  //         //     })
  //         //     ;
  //         bool isDeleted=await Navigator.push(
  //           context,
  //            MaterialPageRoute(
  //           builder: (context)=> UpdateTaskScreen(task: completedTasksList[index],)));
  //         if (isDeleted){
  //           getTasks();
  //         }
  //          }
              
  //           ,
  //           onChanged: (value) async {
  //            AppDialog.showDialogLoading(context);
  //            await FireBaseStore.changeTaskStatus(completedTasksList[index].id, value!);
  //            if (context.mounted) Navigator.pop(context);
  //            getTasks();
  //            getCompletedTasks();
  //          },
  //           isCompleted: completedTasksList[index].isCompeleted, 
            
  //           tasksList: completedTasksList, 
  //           index: index);
  //        }),
  //         separatorBuilder: (context, index) => SizedBox(height: 12,),
  //         itemCount: completedTasksList.length,
               
  //         ),
  //      )
        
  //         ],
  //       ),
  //     )