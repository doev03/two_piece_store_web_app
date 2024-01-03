import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/theme.dart';
import '../../../core/styles/typography.dart';
import '../../../core/utils/extensions.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({
    required this.price,
    super.key,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(spacing3),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: primaryBorderRadius,
      ),
      child: Text(
        price.formatMoney(),
        style: AppTypography.title3.copyWith(color: theme.colorScheme.onBackground),
      ),
    );
  }
}
