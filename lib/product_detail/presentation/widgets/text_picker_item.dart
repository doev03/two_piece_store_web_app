import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/typography.dart';
import 'picker_item_box.dart';

class TextPickerItem extends StatelessWidget {
  const TextPickerItem(
    this.text, {
    required this.selected,
    required this.onPressed,
    super.key,
  });

  final String text;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PickerItemBox(
      selected: selected,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing2, vertical: spacing1),
        child: Text(
          text,
          style: AppTypography.headline3.copyWith(color: theme.colorScheme.onBackground),
        ),
      ),
    );
  }
}
