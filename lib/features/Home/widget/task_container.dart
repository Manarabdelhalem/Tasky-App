import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.onChanged, required this.isCompleted, this.onTap,required this.tasksList, required this.index});
  final void Function(bool?)? onChanged;
  final bool isCompleted;
  final void Function()? onTap;
  final List tasksList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
         onTap: onTap,
         child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
             decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)
                ),
            child: Row(
              children: [
Checkbox(
  value: isCompleted,
  activeColor: Colors.deepPurple,
  shape: CircleBorder(),
  onChanged: onChanged,
),
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
  }
}