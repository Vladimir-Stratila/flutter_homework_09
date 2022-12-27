import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  const CustomFormField({
    required this.labelText,
    this.validator,
    this.onSaved,
    super.key}
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    );
  }
}