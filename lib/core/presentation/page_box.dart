import 'package:flutter/material.dart';

class PageBox extends StatelessWidget {
  const PageBox({
    required this.child,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = this.backgroundColor ?? theme.scaffoldBackgroundColor;

    return Material(
      color: backgroundColor,
      child: child,
    );
  }
}
