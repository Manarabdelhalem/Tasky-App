
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/constant/app_icon.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';
import 'package:tasky_app/features/Auth/view/widget/elevated_widget.dart';
import 'package:tasky_app/features/Auth/view/widget/google_button.dart';
import 'package:tasky_app/features/Auth/view/widget/have_account.dart';
import 'package:tasky_app/features/Auth/view/widget/or_continue_with.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapShot) {
          if(snapShot.hasData){
            return HomeScreen();
          }
          else{
          return Stack(
            children: [
              SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
          
                          Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
          
                          TextFormFieldWidget(
                            hintText: "User Name",
                            userNameController: userNameController,
                            validator: (value) =>
                                value!.isEmpty ? "Required" : null,
                            // prefixIcon: Icons.person_outline,
                            prefixIcon: Icons.person,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            hintText: "Email Address",
                            userNameController: emailController,
                            validator: (value) =>
                                value!.isEmpty ? "Required" : null,
                            prefixIcon: Icons.email_outlined,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            hintText: "Password",
                            userNameController: passwordController,
                            validator: (value) =>
                                value!.isEmpty ? "Required" : null,
                            prefixIcon: Icons.lock_outline,
                          ),
                          const SizedBox(height: 20),
                          TextFormFieldWidget(
                            hintText: "Confirm Password",
                            userNameController: confirmController,
                            validator: (value) => value != passwordController.text
                                ? "Mismatch"
                                : null,
                            prefixIcon: Icons.lock_outline,
                          ),
          
                          const SizedBox(height: 32),
          
          ElevatedWidget(
  title: 'Register',
  onPressed: () async {
    if (formKey.currentState!.validate()) {
      // 1. Show a loading indicator if you have one
      
      // 2. Call the Firebase method
      String? result = await FirebaseAuthAuthentication.createUserWithEmail(
      email:   emailController.text.trim(),
      password:   passwordController.text.trim(),
      );

      if (result == "Success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration successful!"),)
        );
      } else {
        // 3. Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result ?? "An error occurred")),
        );
      }
    }
  },
),
          
                          const SizedBox(height: 32),
                          OrContinueWith(),
          
                          const SizedBox(height: 24),
          GoogleButton()
                          ,
          
                          const SizedBox(height: 32),
          HaveAccount(rout: LoginScreen(), textbutton: "Login")
                          ,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );}
        }
      ),
    );
  }
}

