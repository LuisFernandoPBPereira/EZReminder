import 'package:EZReminder/global/ezreminder_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(EzreminderColors.primaryVerde),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        fixedSize: const Size(245, 49),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: Text(
        label,
        style: TextStyle(color: Color(EzreminderColors.backgroundPreto)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
