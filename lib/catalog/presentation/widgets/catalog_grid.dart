import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:js/js.dart';

import '../../../../core/styles/spacings.dart';
import '../../../core/presentation/failure_indicator.dart';
import '../../../core/presentation/page_progress_indicator.dart';
import '../bloc/catalog_cubit.dart';
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        switch(state) {
          case CatalogInitial():
          case CatalogInProgress():
            return const PageProgressIndicator();
          case CatalogSuccess(items: final items):
            return GridView.builder(
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
                  },
                );
              },
            );
          case CatalogFailure():
            return const FailureIndicator();
        }
      },
    );
  }
}
