
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';
import 'package:tasky_app/features/Home/widget/material_button_widget.dart';

abstract class AppDialog {
static void showDialogLoading(BuildContext context) {
 showDialog(context: context, builder: (builder){
  return AlertDialog(
    content: Row(children: [
      CircularProgressIndicator(),
      SizedBox(width: 16),
      Text("Loading", style: TextStyle(fontSize: 16),)  
    ],),
  );
 });
}

static void showErrorDialog(BuildContext context,String message){
showDialog(context: context, builder: (builder){
  return AlertDialog(
    content: Text(message,style: TextStyle(color: Colors.red),),
actions: [
  MaterialButtonWidget(text: "Ok", onPressed: (){
    Navigator.pop(context);
  })
],

  );
});
}
static void showVerifyDialog(BuildContext context){
showDialog(context: context, builder: (builder){
  return AlertDialog(
    content: Text("Account created! Please check your email to verify.",style: TextStyle(color: Colors.blue),),
actions: [
  MaterialButtonWidget(text: "Ok", onPressed: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  })
],

  );
});
}
}

class AppDialogError extends AppDialog {
  // static showErrorDialog(BuildContext context, String message) {
  //   showDialog(context: context, builder: (builder){
  //     return AlertDialog(
  //       title: Text("Error"),
  //       content: Text(message),
  //       actions: [
  //         TextButton(onPressed: (){
  //           Navigator.pop(context);
  //         }, child: Text("OK"))
  //       ],
  //     );
  //   });
  // }
//  static showErrorDialog 
}
