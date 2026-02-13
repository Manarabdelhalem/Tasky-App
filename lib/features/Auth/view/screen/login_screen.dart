
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app/core/constant/app_icon.dart';
import 'package:tasky_app/core/utils/auth_validator.dart';
import 'package:tasky_app/features/Auth/services/firebase_auth.dart';
import 'package:tasky_app/features/Auth/view/screen/forget_password.dart';
import 'package:tasky_app/features/Auth/view/screen/register_screen.dart';
import 'package:tasky_app/features/Auth/view/widget/elevated_widget.dart';
import 'package:tasky_app/features/Auth/view/widget/google_button.dart';
import 'package:tasky_app/features/Auth/view/widget/have_account.dart';
import 'package:tasky_app/features/Auth/view/widget/or_continue_with.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
import 'package:tasky_app/features/Home/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
bool isLoading = false; 

  @override
  void dispose() {
   
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        String? result = await FirebaseAuthAuthentication.signInWithEmail(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (!mounted) return;

        if (result == "Success") {
        
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
          );
        } else {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result ??"An unknown error occurred"),
              backgroundColor: Colors.orange, 
            ),
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
      backgroundColor: const Color(0xff5F33E1),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldWidget(
                              hintText: "Email Address",
                              userNameController: emailController,
                              validator: Validator.validateEmail,
                              prefixIcon: Icons.email_outlined,
                            ),
                            const SizedBox(height: 16),
                            TextFormFieldWidget(
                              hintText: "Password",
                              userNameController: passwordController,
                              validator: Validator.validatePassword,
                                 
                              prefixIcon: Icons.lock_outline,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                       ForgetPasswordScreen())),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff5F33E1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedWidget(
            onPressed: isLoading ? null : _login, 
            title: isLoading ? "Logging in..." : "Login",
          ),
                      const SizedBox(height: 32),
                  OrContinueWith()    ,
                      const SizedBox(height: 22),
                      Center(
                        child: GoogleButton(),
                      ),
                      const SizedBox(height: 24),
                      HaveAccount(
                          rout: RegisterScreen(), textbutton: "Register", title: "Don't have an account?",),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}