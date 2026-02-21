import 'package:flutter/material.dart';
import 'package:tasky_app/core/utils/app_dialog.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';
import 'package:tasky_app/features/Home/model/task_model.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key,required this.task});
final  TaskModel task;
static const String routeName="/updateTaskScreen";

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(onPressed: (){
        Navigator.pop(context);
       }, icon: Icon(Icons.cancel,size: 30, color: Colors.red,)),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              trailing: Icon(Icons.edit, size: 30, color: Colors.deepPurple,),
              title: Text(widget.task.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              subtitle: Text(widget.task.description,style: TextStyle(fontSize: 16,color: Colors.grey),),
              leading: Radio(value:   (value){}),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month, color: Colors.deepPurple)),
                  Text("Task Time : ${widget.task.date.day} ${widget.task.date.month} ${widget.task.date.year}",
                  style: TextStyle(fontSize: 18),),
                  Spacer(),
                 MaterialButton(
                  onPressed: (){}, 
                  color: Colors.grey[300],
                  child: Text("Today"),
                  
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: (){},
                   icon: Icon(Icons.flag_outlined, color: Colors.deepPurple)),
                  Text("Task Pririty : ",style: TextStyle(fontSize: 18),),
                  Spacer(),
                 MaterialButton(
                  color: Colors.grey[300],
                  onPressed: (){},
                   child: Text("Default"),),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      AppDialog.showDialogLoading( context);
FireBaseStore.deleteTask(widget.task.id).then((_){
  Navigator.pop(context);
  Navigator.pop(context);
}).catchError((e){
  AppDialog.showErrorDialog(context, e);
});


                  }, icon: Icon(Icons.delete, color: Colors.red)),
                  Text("Delete Task", style: TextStyle(fontSize: 18),),
                  
                ],
              ),
              //Spacer(),
              // MaterialButton(
              //   onPressed: (){}, 
              //   color: Colors.deepPurple,
              //   child: Text("Edit Task", style: TextStyle(color: Colors.white),),
              //   minWidth: double.infinity,
              //   height: 50,
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12)
              //   ),
              //   )
          ],
        ),
      ), 
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MaterialButton(
                  onPressed: (){}, 
                  color: Colors.deepPurple,
                  child: Text("Edit Task", style: TextStyle(color: Colors.white,fontSize: 18),),
                  minWidth: double.infinity,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  ),
      ), );  
  }
}