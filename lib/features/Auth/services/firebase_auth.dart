import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_app/core/utils/shared_preference_file.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';

class FirebaseUserAuthentication {
 
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? getCurrentUser() => _auth.currentUser;

  static Future<String?> signUpWithEmail({required String email, required String password}) async {
    try {
  UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      await _auth.currentUser!.sendEmailVerification();
      await SharedPreferenceFile.saveData("Id",_auth.currentUser!.uid);
      //return "Success";
      log(  "User created successfully. Verification email sent to $email");
    } on FirebaseAuthException catch (e) {
     // return e.message; 
     log( "FirebaseAuthException: ${e.message}");
     throw Exception(e.message ?? "An error occurred during registration. Please try again.");
    } catch (e) {
     // return e.toString();
     log( "Exception: ${e.toString()}");
     throw Exception("An error occurred during registration. Please try again.");
    }
  }
static Future<void> signInWithEmail({required String email, required String password}) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.reload();
    User? user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      
      throw Exception("Please verify your email before logging in.");
    }
  } on FirebaseAuthException catch (e) {

    String message = "An error occurred";
    if (e.code == 'user-not-found') message = "No user found for that email.";
    else if (e.code == 'wrong-password') message = "Wrong password provided.";
    else message = e.message ?? message;
    
    throw Exception(message);
  } catch (e) {
    throw Exception("Something went wrong, please try again.");
  }
}

static Future<void> signOut () async {
  await _auth.signOut();
}


static Future<String?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return "Cancelled";

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

   
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    User? user = userCredential.user;

    if (user != null) {
     
      bool userExists = await FireBaseStore.checkUserExists(user.uid);

      if (!userExists) {
        
        UserModel newUser = UserModel(
          userName: user.displayName ?? "User ${user.uid.substring(0, 5)}",
          email: user.email ?? "",
          password: "", 
          userId: user.uid,
        );
        
      
        await FireBaseStore.saveUserToFireStore(user: newUser);
      }
    }

    return "Success";
  } catch (e) {
    return e.toString();
  }
}
static void register({required String password,required String userName}){}
}
