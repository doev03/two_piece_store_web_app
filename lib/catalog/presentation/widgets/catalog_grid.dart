import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:native_scroll/native_scroll.dart';

import '../../../../core/styles/spacings.dart';
import '../../domain/entity/catalog_item.dart';
import 'catalog_item.dart';

@JS()
@staticInterop
class JSWindow {}

extension JSWindowExtension on JSWindow {
  external String get name;
  String get nameAllCaps => name.toUpperCase();
}

class CatalogGrid extends StatelessWidget {
  const CatalogGrid({
    required this.items,
    super.key,
  });

  final List<CatalogItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return NativeScrollBuilder(
      builder: (context, controller) {
        return GridView.builder(
          controller: controller,
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
              onPressed: () {},
            );
          },
        );
      },
    );
  }
}
