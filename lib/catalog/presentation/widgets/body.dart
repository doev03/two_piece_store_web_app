import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/failure_indicator.dart';
import '../../../core/presentation/page_progress_indicator.dart';
import '../bloc/catalog_cubit.dart';
import 'catalog_grid.dart';

class CatalogPageBody extends StatelessWidget {
  const CatalogPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        switch (state) {
          case CatalogInitial():
          case CatalogInProgress():
            return const PageProgressIndicator();
          case CatalogSuccess(items: final items):
            return CatalogGrid(items: items);
          case CatalogFailure():
            return const FailureIndicator();
        }
      },
    );
  }
}
