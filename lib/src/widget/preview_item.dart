import 'package:flutter/material.dart';

class PreviewItem extends StatelessWidget {
  final int flex;
  final String label;
  final String value;

  const PreviewItem({
    Key? key,
    required this.label,
    required this.value,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Card(
        elevation: 0,
        child: ListTile(
          title: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
          subtitle: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
