import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';

class FireBaseStore {
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static Future SaveUserToFireStore({required UserModel user}) async{
    try{
      await db.collection("users").doc(user.userId).set(user.toMap());
    } catch (e) {
      print("Error writing to Firestore: $e");
    }
  }
}