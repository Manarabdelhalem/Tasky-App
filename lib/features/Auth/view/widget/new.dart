
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tasky_app/core/constant/app_icon.dart';
// import 'package:tasky_app/features/Auth/view/screen/forget_password.dart';
// import 'package:tasky_app/features/Auth/view/screen/register_screen.dart';
// import 'package:tasky_app/features/Auth/view/widget/text_form_widget.dart';
// import 'package:tasky_app/features/Home/home_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();


//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff5F33E1),
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: const Text(
//                     "Sign In",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 50,
//                       //fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: AlignmentGeometry.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.80,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 20),

//                       Text(
//                         "Welcome Back",
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(height: 30),

                     
//                       const SizedBox(height: 20),
//                       TextFormFieldWidget(
//                         hintText: "Email Address",
//                         userNameController: emailController,
//                         validator: (value) =>
//                             value!.isEmpty ? "Required" : null,
//                         prefixIcon: Icons.email_outlined,
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormFieldWidget(
//                         hintText: "Password",
//                         userNameController: passwordController,
//                         validator: (value) =>
//                             value!.isEmpty ? "Required" : null,
//                         prefixIcon: Icons.lock_outline,
//                       ),
//                       const SizedBox(height: 16),
                     
                    
//                       Align(
//                         alignment: AlignmentGeometry.topRight,
//                         child: InkWell(
//                           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (builder)=>ForgetPasswordScreen())),
//                           child: Text("Forgot Password ? ", style: TextStyle(
//                                   color: Color(0xff5F33E1),
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16
//                                 ),)),
//                       ),
//                         const SizedBox(height: 40),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(builder: (builder) => HomeScreen()),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xff5F33E1),
//                           foregroundColor: Colors.white,
//                           minimumSize: const Size(double.infinity, 56),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 0,
//                         ),
//                         child: const Text(
//                           "Sign In",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),

//                       const SizedBox(height: 24),
//                       Row(
//                         children: [
//                           Expanded(child: Divider(color: Colors.grey)),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             child: Text(
//                               "OR CONTINUE WITH",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 letterSpacing: 0.5,
//                               ),
//                             ),
//                           ),
//                           Expanded(child: Divider(color: Colors.grey)),
//                         ],
//                       ),

//                       const SizedBox(height: 24),

                      
//                           Center(
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 foregroundColor: Colors.grey,
//                                 elevation: 0,
//                                 minimumSize: const Size(20, 56),
//                                 side: BorderSide(color: Colors.grey),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                              child:
//                                   SvgPicture.asset(
//                                    AppIcon.googleIcon,
//                                     width: 28,
//                                     height: 28,
//                                   ),
                               
                                
                              
//                             ),
//                           ),
//                           const SizedBox(width: 16),

                          
                       

//                       const SizedBox(height: 32),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don’t have an account? ",
//                             style: TextStyle(color: Colors.grey,
                            
//                             fontSize: 18,
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () => Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (builder) => RegisterScreen(),
//                               ),
//                             ),
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 decorationColor: Color(0xff5F33E1),
//                                 decoration: TextDecoration.underline,
//                                 color: Color(0xff5F33E1),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
