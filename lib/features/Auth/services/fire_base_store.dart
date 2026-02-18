import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';

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
}
