import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.userNameController,
    required this.validator,
    required this.prefixIcon
  });
  String hintText;
  TextEditingController? userNameController;
  String? Function(String?)? validator;
  IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: userNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon:Icon( prefixIcon,color: Colors.grey,),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
         contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
      ),
    );
  }
}
