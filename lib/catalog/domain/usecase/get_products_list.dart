import 'package:equatable/equatable.dart';

import '../../../core/domain/entity/product.dart';
import '../../../core/utils/usecase.dart';
import '../../data/repository/catalog_repository.dart';

class GetProductsList extends UseCase<List<ProductEntity>, GetProductsListParams> {
  GetProductsList({
    required CatalogRepository catalogRepository,
  }) : _catalogRepository = catalogRepository;

  final CatalogRepository _catalogRepository;

  @override
  Future<List<ProductEntity>> call(GetProductsListParams params) {
    return _catalogRepository.getProductsList();
  }
}

class GetProductsListParams extends Equatable {
  @override
  List<Object?> get props => [];
}
