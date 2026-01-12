import 'package:flutter/material.dart';
import 'package:tasky_app/features/Auth/view/screen/login_screen.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key,required this.rout, required this.textbutton});
final Widget rout;
final String textbutton;
  @override
  Widget build(BuildContext context) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey,
                            
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => rout,
                              ),
                            ),
                            child: Text(
                              textbutton,
                              style: TextStyle(
                                 decorationColor:Color(0xff5F33E1),
                                decoration: TextDecoration.underline,
                                color: Color(0xff5F33E1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ],
                      );
  }
}