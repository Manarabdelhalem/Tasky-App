// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String id;
  String title;
  String description;
  int priority;
  DateTime date;
  bool isCompeleted;
  TaskModel({
    this.isCompeleted=false,
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });

   Map<String, dynamic> toJson(){
  return <String, dynamic> {
    "id":id,
    "title":title,
    "description":description,
    "priority":priority,
    "date":date.millisecondsSinceEpoch,
    "isCompeleted":isCompeleted,
  };
}


factory  TaskModel.fromJson(Map<String, dynamic> json){
return TaskModel(
  isCompeleted: json["isCompeleted"] as bool? ?? false,
  id: json["id"],
  title: json["title"],
  description: json["description"],
  priority: json["priority"],
  date: DateTime.fromMillisecondsSinceEpoch(json["date"] as int),
);}

  
}
