import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/catalog_item.dart';
import '../../domain/usecase/get_catalog_items.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit({
    required GetCatalogItems getCatalogItems,
  }) : _getCatalogItems = getCatalogItems, super(CatalogInitial());

  final GetCatalogItems _getCatalogItems;

  Future<void> fetchCatalogItems() async {
    if (state is CatalogInProgress) return;
    emit(CatalogInProgress());

    try {
      final list = await _getCatalogItems(null);
      emit(CatalogSuccess(items: list));
    } catch (_) {
      emit(CatalogFailure());
      rethrow;
    }
  }
}
