import 'package:flutter/material.dart';

class PageBox extends StatelessWidget {
  const PageBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.background,
      child: child,
    );
  }
}
