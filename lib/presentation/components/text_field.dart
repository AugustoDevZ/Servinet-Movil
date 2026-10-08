import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hint;
  final bool isPasswordField;
  final IconData iconUse;
  final TextEditingController controller;

  const PrimaryTextField({
    super.key,
    required this.hint,
    required this.isPasswordField,
    required this.iconUse,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, left: 3.0, right: 3.0),
      child: TextField(
        controller: controller,
        obscureText: isPasswordField,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(iconUse, color: const Color(0xFF2CA6EF)),
          filled: true,
          fillColor: const Color(0xFFF8FAFC),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF2CA6EF), width: 2),
          ),
        ),
      ),
    );
  }
}
