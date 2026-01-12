import 'package:flutter/material.dart';

class ElevatedWidget extends StatelessWidget {
   ElevatedWidget({super.key, required this.onPressed, required this.title});
Function()? onPressed;
final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                       onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5F33E1),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child:  Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
  }
}