import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? initialValue;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? Function(String?)? validation;
  final void Function(String?)? onSaved;

  const TextFormInput({
    Key? key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.validation,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: keyboardType,
        controller: controller,
        initialValue: initialValue,
        decoration: InputDecoration(labelText: label),
        validator: validation,
        onSaved: onSaved,
      ),
    );
  }
}
