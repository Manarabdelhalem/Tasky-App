import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';

class FirebaseAuthAuthentication {
 
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? getCurrentUser() => _auth.currentUser;





  static Future<String?> createUserWithEmail({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );
      await _auth.currentUser!.sendEmailVerification();
      return "Success";
    } on FirebaseAuthException catch (e) {
      return e.message; // Returns the specific error (e.g., "email already in use")
    } catch (e) {
      return e.toString();
    }
  }
 static Future<String?> signInWithEmail({required String email, required String password}) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // تحديث بيانات المستخدم للتأكد من حالة التفعيل
    await userCredential.user?.reload();
    User? user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      return "الرجاء تفعيل حسابك من خلال الرابط المرسل إلى بريدك الإلكتروني.";
    }

    return "Success";
  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (e) {
    return e.toString();
  }
}

static Future<void> signOut () async {
  await _auth.signOut();
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
