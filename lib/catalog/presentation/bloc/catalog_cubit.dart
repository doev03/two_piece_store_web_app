import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/catalog_item.dart';
import '../../domain/usecase/get_products_list.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit({
    required GetProductsList getProductsList,
  }) : _getProductsList = getProductsList, super(CatalogInitial());

  final GetProductsList _getProductsList;

  Future<void> fetchProductsList() async {
    if (state is CatalogInProgress) return;
    emit(CatalogInProgress());

    try {
      final list = await _getProductsList(GetProductsListParams());
      emit(CatalogSuccess(items: list));
    } catch (_) {
      emit(CatalogFailure());
      rethrow;
    }
  }
}
