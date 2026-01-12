import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAuthentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User? getCurrentUser() => _firebaseAuth.currentUser;

 
  static Future<String?> createUserWithEmail({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message; // Returns the specific error (e.g., "email already in use")
    } catch (e) {
      return e.toString();
    }
  }
 

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
}
