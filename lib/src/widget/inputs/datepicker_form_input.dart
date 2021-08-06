import 'package:flutter/material.dart';
import "package:challenge_flutter/src/utils/extensions.dart";
import 'package:intl/intl.dart';

class DatePickerFormInput extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChange;
  final String label;

  const DatePickerFormInput({
    Key? key,
    required this.onChange,
    this.value,
    required this.label,
  }) : super(key: key);

  void _openDatePicker(BuildContext context) async {
    late DateTime initial;

    if (value != null) {
      final format = new DateFormat('dd/MM/yyyy');
      initial = format.parse(value!);
    } else {
      initial = DateTime.now();
    }

    var datetime = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );

    if (datetime == value) return;
    if (datetime is DateTime) onChange(datetime.toLocalString);
    if (datetime == null) onChange(null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () => _openDatePicker(context),
        child: InputDecorator(
          isEmpty: value == null,
          decoration: InputDecoration(labelText: label),
          child: Text(value ?? ""),
        ),
      ),
    );
  }
}
