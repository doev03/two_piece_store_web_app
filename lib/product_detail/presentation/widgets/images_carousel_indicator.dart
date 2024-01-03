import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';

class ImagesCarouselIndicator extends StatelessWidget {
  const ImagesCarouselIndicator({
    required this.page,
    required this.pageCount,
    super.key,
  });

  final int page;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: kThemeChangeDuration,
          margin: index != pageCount - 1 ? const EdgeInsets.only(right: spacing2) : EdgeInsets.zero,
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: page == index ? theme.colorScheme.primary : theme.colorScheme.tertiary,
          ),
        );
      }),
    );
  }
}
