import 'package:flutter/material.dart';

class CustomIndecator extends StatelessWidget {
  final bool active;
  const CustomIndecator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10, 
      width: active ? 30 : 10,
      decoration: BoxDecoration(
        color: active ? const Color(0xff5F33E1) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}