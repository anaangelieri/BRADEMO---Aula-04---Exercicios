import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final IconData? icon;
  final List<TextInputFormatter>? inputFormatters;

  const FormTextField(
      {required this.label,
      required this.controller,
      required this.validator,
      required this.icon,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label, prefixIcon: icon != null ? Icon(icon) : null),
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }
}