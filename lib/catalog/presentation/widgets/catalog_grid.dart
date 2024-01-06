import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/spacings.dart';
import '../../../core/presentation/widgets/adaptive_scroll_builder.dart';
import '../../../router/app_router.dart';
import '../../domain/entity/catalog_item.dart';
import 'catalog_item.dart';

class CatalogGrid extends StatelessWidget {
  const CatalogGrid({
    required this.items,
    super.key,
  });

  final List<CatalogItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScrollBuilder(
      builder: (context, controller) {
        return GridView.builder(
          controller: controller,
          physics: controller == null ? null : const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(spacing5),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: spacing5,
            crossAxisSpacing: spacing5,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return CatalogItem(
              product: item,
              onPressed: () {
                context.navigateTo(ProductDetailRoute(id: item.id));
              },
            );
          },
        );
      },
    );
  }
}
