import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';

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
      return e.message; 
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


    await userCredential.user?.reload();
    User? user = _auth.currentUser;

    if (user != null && !user.emailVerified) {
      return "Please verify your email before logging in by clicking the link sent to your inbox.";
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
        
      
        await FireBaseStore.SaveUserToFireStore(user: newUser);
      }
    }

    return "Success";
  } catch (e) {
    return e.toString();
  }
}
static void register({required String password,required String userName}){}
}
