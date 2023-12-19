import '../../../core/domain/entity/product.dart';
import '../../../core/utils/usecase.dart';
import '../../data/repository/catalog_repository.dart';

class GetProductsList extends UseCase<List<ProductEntity>, void> {
  GetProductsList({
    required CatalogRepository catalogRepository,
  }) : _catalogRepository = catalogRepository;

  final CatalogRepository _catalogRepository;

  @override
  Future<List<ProductEntity>> call(void params) {
    return _catalogRepository.getProductsList();
  }
}

class GetProductsListParams {}
