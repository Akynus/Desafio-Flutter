import 'package:flutter/material.dart';

class PreviewHeader extends StatelessWidget {
  final String label;

  const PreviewHeader({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 40, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 5),
            Divider()
          ],
        ),
      ),
    );
  }
}
