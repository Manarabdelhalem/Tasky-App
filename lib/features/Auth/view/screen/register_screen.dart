
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/constant/app_icon.dart';
import 'package:tasky_app/core/utils/auth_validator.dart';
import 'package:tasky_app/features/Auth/model/user_model.dart';
import 'package:tasky_app/features/Auth/services/fire_base_store.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';
import 'package:tasky_app/features/Auth/view/widget/elevated_widget.dart';
import 'package:tasky_app/features/Auth/view/widget/google_button.dart';
import 'package:tasky_app/features/Auth/view/widget/have_account.dart';
import 'package:tasky_app/features/Auth/view/widget/or_continue_with.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';

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
  bool isLoading = false;

  @override
  void dispose() {

    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true); 

      try {
        String? result = await FirebaseAuthAuthentication.createUserWithEmail(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

    
        if (!mounted) return;

        if (result == "Success") {
          UserModel newUser = UserModel(
            userName: userNameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            userId: FirebaseAuthAuthentication.getCurrentUser()!.uid,
          );

          await FireBaseStore.SaveUserToFireStore(user: newUser);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Registration successful! we send verification email"), backgroundColor: Colors.green),
            );

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        } else {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result ?? "An error occurred"), backgroundColor: Colors.red),
          );
        }
      } finally {

        if (mounted) setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Stack(
            children: [
              SafeArea(
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
                      child: Form(
                        key: formKey,
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
                              validator: Validator.validateName,
                              // prefixIcon: Icons.person_outline,
                              prefixIcon: Icons.person,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              hintText: "Email Address",
                              userNameController: emailController,
                              validator: Validator.validateEmail,
                                 
                              prefixIcon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              hintText: "Password",
                              userNameController: passwordController,
                              validator: Validator.validatePassword,
                              prefixIcon: Icons.lock_outline,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              hintText: "Confirm Password",
                              userNameController: confirmController,
                              validator: (value) => Validator.validateConfirmPassword(value, passwordController.text),
                              prefixIcon: Icons.lock_outline,
                            ),
                                  
                            const SizedBox(height: 32),
                                  
                        
                        
                        ElevatedWidget(
                                    title: isLoading ? 'Please wait...' : 'Register',
                                  
                                    onPressed: isLoading ? null : _signUp, 
                                  ),
                                  
                            const SizedBox(height: 32),
                            OrContinueWith(),
                                  
                            const SizedBox(height: 24),
                                  GoogleButton()
                            ,
                                  
                            const SizedBox(height: 32),
                                  HaveAccount(rout: LoginScreen(), textbutton: "Login", title: "Already have an account?",)
                            ,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
    );
  }
}



