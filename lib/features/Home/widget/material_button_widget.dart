import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({super.key,
  this.bgColor,
  this.textColor,
  required this.text,
  required this.onPressed,
  this.height=50
  });
final double height;
final Color? bgColor;
final Color? textColor;
final String text;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                       height: height, 
                        onPressed: onPressed, 
                      elevation: 0,
                      color:bgColor ?? Colors.deepPurple,
                      child: Text(text,
                      style: TextStyle(color:textColor ?? Colors.white),
                      ),
                      );
  }
}