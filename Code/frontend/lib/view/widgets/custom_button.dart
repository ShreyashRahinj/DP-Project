import 'package:flutter/material.dart';
import 'package:frontend/view/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        decoration: BoxDecoration(
          color: PrimaryTheme.appWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
