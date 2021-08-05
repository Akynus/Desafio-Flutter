import 'package:flutter/material.dart';

class FloatingButtonLoading extends StatelessWidget {
  final bool loading;
  final Widget? icon;
  final Widget label;
  final VoidCallback onPressed;
  final Object? heroTag;

  const FloatingButtonLoading({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.heroTag,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      isExtended: !loading,
      onPressed: loading ? null : onPressed,
      icon: loading ? null : icon,
      label: loading ? CircularProgressIndicator(color: Colors.white) : label,
    );
  }
}
