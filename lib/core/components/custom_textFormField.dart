// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.icon,
    this.controller,
    this.keyboardType,
  });
  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border:const OutlineInputBorder(),
        label: Text(label),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
