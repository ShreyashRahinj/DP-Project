import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final IconData icon;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width / 4,
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: controller,
          style: const TextStyle(
            color: PrimaryTheme.appBlack,
          ),
          cursorColor: PrimaryTheme.tabDisable,
          decoration: InputDecoration(
            filled: true,
            fillColor: PrimaryTheme.appWhite,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.1,
                color: PrimaryTheme.tabDisable,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.01,
                color: PrimaryTheme.tabDisable,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: PrimaryTheme.appBlack.withOpacity(0.3),
            ),
            icon: Icon(icon),
            iconColor: PrimaryTheme.tabDisable,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
