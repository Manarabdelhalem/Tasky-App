import 'package:flutter/material.dart';

class OrContinueWith extends StatelessWidget {
  const OrContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                        children: [
                          const Expanded(
                              child: Divider(
                            color: Colors.grey,
                          )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            child: const Text(
                              "OR CONTINUE WITH",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Divider(
                            color: Colors.grey,
                          )),
                        ],
                      );
  }
}