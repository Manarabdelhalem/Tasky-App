// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String id;
  String title;
  String description;
  int priority;
  DateTime date;
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });

   Map<String, dynamic> toJson(TaskModel task){
  return {
    "id":task.id,
    "title":task.title,
    "description":task.description,
    "priority":task.priority,
    "date":task.date.millisecondsSinceEpoch,
  };
}


factory  TaskModel.fromJson(Map<String, dynamic> json){
return TaskModel(
  id: json["id"],
  title: json["title"],
  description: json["description"],
  priority: json["priority"],
  date: DateTime.fromMillisecondsSinceEpoch(json["date"] as int),
);}

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'priority': priority,
  //     'date': date.millisecondsSinceEpoch,
  //   };
  // }

  // factory TaskModel.fromMap(Map<String, dynamic> map) {
  //   return TaskModel(
  //     id: map['id'] as String,
  //     title: map['title'] as String,
  //     description: map['description'] as String,
  //     priority: map['priority'] as int,
  //     date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
  //   );
  // }

  
}
