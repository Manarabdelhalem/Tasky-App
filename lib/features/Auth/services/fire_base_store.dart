import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';
import 'package:tasky_app/features/Home/model/task_model.dart';

class FireBaseStore {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

static CollectionReference<UserModel> getCollectionUser(){
  return db.collection("users").
  withConverter<UserModel>
  (fromFirestore: (snapShot,options)=>UserModel.fromMap(snapShot.data()!), 
  toFirestore: (user,options)=>user.toMap());
}

  static Future saveUserToFireStore({required UserModel user}) async{
    try{
      await getCollectionUser().doc(user.userId).set(user);
    } catch (e) {
     log("Error writing to Firestore: $e");
    }
  }
  static Future<bool> checkUserExists(String userId) async{
    try{
     var user =await getCollectionUser().doc(userId).get();
     return user.exists; 
    }catch(e){
return false;
    }
  }

static CollectionReference<TaskModel> collectionTasks(){
 String userId=FirebaseAuth.instance.currentUser!.uid;
  return getCollectionUser().doc(userId).collection("Tasks")
  .withConverter<TaskModel>(
    fromFirestore: (snapShot,options)=>TaskModel.fromJson(snapShot.data()!),
     toFirestore: (value,options)=>value.toJson());
}


static Future<void> addTask({required TaskModel task})async{
  await collectionTasks().doc(task.id).set(task);
}
static Future<void>  updateTask(TaskModel task)async{
  await collectionTasks().doc(task.id).update(task.toJson());
}
  static Future<void> deleteTask(String taskId)async{
    await collectionTasks().doc(taskId).delete();
}
// في FireBaseStore

static Stream<List<TaskModel>> getAllTasks() {
  return collectionTasks()
     // .where("isCompeleted", isEqualTo: false)
      .snapshots()  // ← ده اللي بيعمل Stream حقيقي
      .map((querySnapshot) {
        return querySnapshot.docs.map((doc) => doc.data()).toList();
      });
}

static Stream<List<TaskModel>> getAllCompletedTasks() {
  return collectionTasks()
      .where("isCompeleted", isEqualTo: true)
      .snapshots()
      .map((querySnapshot) {
        return querySnapshot.docs.map((doc) => doc.data()).toList();
      });
}

// static Future<List<TaskModel>> getAllTasksNotCompeleted()async{

  
// var listOfTasks=await collectionTasks().where("isCompeleted", isEqualTo: false).get();
// return listOfTasks.docs.map((snapshot){
// return snapshot.data();
// }).toList();
// }

//   static Future<List<TaskModel>> getAllCompletedTasks()async{

// var querySnapShot=await collectionTasks().where("isCompeleted", isEqualTo: true)
// .get();

// return querySnapShot.docs.map((snapShot){
  
//   return snapShot.data();
  
// }).toList();



// }

static  Future<void> changeTaskStatus(String taskId,bool isDone)async{
await collectionTasks().doc(taskId).update({"isCompeleted" : isDone});
}

}
