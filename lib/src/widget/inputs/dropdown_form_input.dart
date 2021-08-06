import 'package:flutter/material.dart';

class DropdownFormInput<T> extends StatelessWidget {
  final ValueChanged<T?> onChange;
  final T value;
  final List<DropdownMenuItem<T>>? items;
  final String? label;

  const DropdownFormInput({
    Key? key,
    required this.onChange,
    required this.value,
    this.items,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<T>(
          value: value,
          decoration: InputDecoration(
            labelText: label,
            contentPadding:  EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 6),
          ),
          icon: Icon(null),
          onChanged: onChange,
          items: items,
        ),
      ),
    );
  }
}
