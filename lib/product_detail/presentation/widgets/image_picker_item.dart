import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/theme.dart';
import 'picker_item_box.dart';

class ImagePickerItem extends StatelessWidget {
  const ImagePickerItem(
    this.image, {
    required this.selected,
    required this.onPressed,
    super.key,
  });

  final ImageProvider image;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return PickerItemBox(
      selected: selected,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(spacing1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(primaryRadius - spacing1 * 2),
          child: Image(
            image: image,
            fit: BoxFit.cover,
            width: 56,
            height: 72,
          ),
        ),
      ),
    );
  }
}
