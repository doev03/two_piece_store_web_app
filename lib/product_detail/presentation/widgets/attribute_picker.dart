import 'package:flutter/material.dart';
import 'package:native_scroll/native_scroll.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/typography.dart';

class AttributePicker extends StatelessWidget {
  const AttributePicker({
    required this.heading,
    required this.children,
    this.horizontalSpacing = 0,
    super.key,
  });

  final String heading;
  final List<Widget> children;
  final double horizontalSpacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
          child: Text(
            heading,
            style: AppTypography.subtitle3.copyWith(color: theme.colorScheme.onBackground),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            horizontalSpacing,
            spacing3,
            horizontalSpacing,
            spacing3,
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(children.length, (index) {
              return Padding(
                padding: index != children.length - 1
                    ? const EdgeInsets.only(right: spacing3)
                    : EdgeInsets.zero,
                child: children[index],
              );
            }),
          ),
        ),
      ],
    );
  }
}
