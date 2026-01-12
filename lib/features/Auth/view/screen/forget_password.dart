
import 'package:flutter/material.dart';
import 'package:tasky_app/features/Auth/view/screen/verify_code.dart';
import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // لون الخلفية أبيض
      appBar: AppBar(
        backgroundColor: Colors.white, // خلفية الهيدر بيضاء
        elevation: 0, // إزالة الظل
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey, // لون أيقونة الرجوع رمادي
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 70),
              const Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff5F33E1), // العنوان باللون الأزرق المطلوب
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "please enter your email to reset that password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey, // النص الفرعي رمادي
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              TextFormFieldWidget(
                hintText: "manar@gmail.com",
                userNameController: emailController,
                validator: (value) => value!.isEmpty ? "Required" : null,
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>  VerifyCodeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5F33E1), // خلفية الزر زرقاء
                  foregroundColor: Colors.white, // نص الزر أبيض
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Send Verification Code",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}