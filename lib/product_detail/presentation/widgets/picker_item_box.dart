import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/theme.dart';

class PickerItemBox extends StatelessWidget {
  const PickerItemBox({
    required this.selected,
    required this.onPressed,
    required this.child,
    super.key,
  });

  final bool selected;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const borderWidth = spacing1;

    return Material(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: primaryBorderRadius,
        side: BorderSide(
          color: selected ? theme.colorScheme.primary : theme.colorScheme.tertiary,
          width: borderWidth,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(borderWidth),
          child: child,
        ),
      ),
    );
  }
}
