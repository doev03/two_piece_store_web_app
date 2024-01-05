import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/theme.dart';
import '../../../../core/styles/typography.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entity/catalog_item.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    required this.product,
    required this.onPressed,
    this.count = 0,
    super.key,
  });

  final CatalogItemEntity product;
  final int count;
  final VoidCallback? onPressed;

  Widget _buildInnerBox({
    required BuildContext context,
    required String text,
    required Alignment alignment,
  }) {
    const radius = Radius.circular(primaryRadius);
    final BorderRadius borderRadius;
    switch(alignment) {
      case Alignment.topLeft:
        borderRadius = const BorderRadius.only(bottomRight: radius);
      case Alignment.topRight:
        borderRadius = const BorderRadius.only(bottomLeft: radius);
      case Alignment.bottomRight:
        borderRadius = const BorderRadius.only(topLeft: radius);
      case Alignment.bottomLeft:
        borderRadius = const BorderRadius.only(topRight: radius);
      default:
        borderRadius = BorderRadius.zero;
        break;
    }

    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        // ignore: lines_longer_than_80_chars
        decoration: BoxDecoration(
          color: AppColors.blackAlpha40,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: AppTypography.caption3.copyWith(color: AppColors.white1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, c) {
                  return Container(
                    height: c.maxHeight,
                    width: c.maxWidth,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: primaryBorderRadius,
                      image: product.images.isEmpty
                          ? null
                          : DecorationImage(
                        fit: BoxFit.cover,
                        image: product.images.first,
                      ),
                    ),
                    child: Stack(
                      children: [
                        _buildInnerBox(
                          context: context,
                          alignment: Alignment.topLeft,
                          text: product.price.formatMoney(),
                        ),
                        if (count > 0)
                          _buildInnerBox(
                            context: context,
                            alignment: Alignment.topRight,
                            text: count.format(),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.name,
              style: AppTypography.headline2.copyWith(color: colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
