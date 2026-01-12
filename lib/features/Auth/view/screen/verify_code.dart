
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // لازم تعملي import للباكيدج دي

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  // الألوان الخاصة بيكي
  final Color primaryBlue = const Color(0xff5F33E1);
  final Color textDark = const Color(0xFF101828);
  final Color textGrey = const Color(0xFF667085);
  final Color borderColor = const Color(0xFFD0D5DD);
  final Color cardBackgroundColor = Colors.white;


  final TextEditingController pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      textStyle: TextStyle(
        fontSize: 22,
        color: textDark,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
    );


    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primaryBlue, width: 2),
    );

   
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.grey.shade100,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: textDark),
        ),
        centerTitle: true,
        title: Text(
          "Verify Code",
          style: TextStyle(
              color: textDark, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
      
                Text(
                  "Please Enter The Code We Just Sent To Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: textGrey),
                ),
                const SizedBox(height: 5),
                Text(
                  "manar@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 40),


                Text(
                  "00:30",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),

                const SizedBox(height: 30),
 
                Pinput(
                  length: 6,
                  controller: pinController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  showCursor: true,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  validator: (s) {
                    return s == '123456' ? null : 'Pin is incorrect';
                  },
                  onCompleted: (pin) {
                    print("Code Entered: $pin");
                  },
                ),
                
                const SizedBox(height: 30),

               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP not receive ? ",
                      style: TextStyle(color: textGrey),
                    ),
                    InkWell(
                      onTap: () {
                   
                      },
                      child: Text(
                        "Send again",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryBlue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

               
                ElevatedButton(
                  onPressed: () {
              
                    String code = pinController.text;
                    print("Verifying code: $code");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}